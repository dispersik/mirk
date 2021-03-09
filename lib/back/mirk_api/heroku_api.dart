import 'dart:convert';

import 'package:mirk/back/entities/chat.dart';
import 'package:mirk/back/entities/message.dart';
import 'package:mirk/back/entities/user.dart';
import 'core.dart';
import 'package:http/http.dart' as http;

class HerokuAPI implements MirkAPIProvider {
  static final _apiURL = 'https://mirk.herokuapp.com/api/v1/';

  // static final _apiURL = 'http://localhost:4747/api/v1/';

  @override
  Future<List<Message>> getChatMessages(Chat chat) async {
    http.Response response;
    var uri = _apiURL + 'messages?chatId=${chat.id}';
    try {
      response = await http.get(uri);
    } catch (e) {
      print(e);
      return Future.error('Failed to get messages');
    }
    if (response.statusCode == 200) return _decodeMessages(response.body);
    return Future.error('Failed to get messages');
  }

  @override
  Future<List<Chat>> getAllChats(User src) async {
    http.Response response;
    var uri = _apiURL + 'chats?userId=${src.id}';
    try {
      response = await http.get(uri);
    } catch (e) {
      print(e);
      return Future.error('Failed to get user list');
    }
    if (response.statusCode == 200) return _decodeChats(response.body);
    return Future.error('Failed to get user list');
  }

  List<Message> _decodeMessages(String body) {
    var result = <Message>[];
    if (body != null || body.length != 0) {
      List<dynamic> list = jsonDecode(body);
      list.forEach((element) {
        result.add(Message.fromResponse(element));
      });
    }
    return result;
  }

  List<User> _decodeUsers(String body) {
    var result = <User>[];
    List<dynamic> list = jsonDecode(body);
    list.forEach((element) {
      result.add(User.fromResponse(element));
    });
    return result;
  }

  List<Chat> _decodeChats(String body) {
    var result = <Chat>[];
    if (body != null || body.length != 0) {
      List<dynamic> list = jsonDecode(body);
      list.forEach((element) {
        result.add(Chat.fromResponse(element));
      });
    }
    return result;
  }

  @override
  Future<void> sendMessage(Message m) async {
    http.Response response;
    var url = _apiURL + 'messages';
    try {
      response = await http.post(url, body: {'message': m.toMap().toString()});
    } catch (e) {
      print(e);
      return Future.error('Failed to send message');
    }
    if (response.statusCode == 200) {
      m.setIdFromResponse(response.body);
      return Future.value(null);
    }
    return Future.error('Failed to send message');
  }

  @override
  Future<bool> addUserToMirk(User user) async {
    http.Response response;
    var url = _apiURL + 'users';
    try {
      response = await http.post(url, body: user.toMap());
    } catch (e) {
      print(e);
      return Future.error('Failed to add user to mirk');
    }
    print(response.body);
    if (response.statusCode == 200) return Future.value(true);
    return Future.error('Failed to add user to mirk');
  }

  @override
  Future<void> addChat(Chat chat) async {
    http.Response response;
    var url = _apiURL + 'chats';
    var body = [];
    chat.users.forEach((element) {
      body.add(element.toMap());
    });
    url+='?users=['+body.toString().substring(1,body.toString().length-1)+']';
    try {
      response = await http.post(url);
    } catch (e) {
      print(e);
      return Future.error('Failed to create a chat');
    }
    print(response.body);
    if (response.statusCode == 200) return Future.value(true);
    return Future.error('Failed to create a chat');
  }

  @override
  Future<void> removeChat(Chat chat) async {
    http.Response response;
    var url = _apiURL + 'chats?chat=${chat.id}';
    try {
      response = await http.delete(url);
    } catch (e) {
      print(e);
      return Future.error('Failed to remove user from user list');
    }
    if (response.statusCode == 200) return Future.value(true);
    return Future.error('Failed to remove user from user list');
  }

  @override
  Future<void> removeMessage(Message m) async {
    http.Response response;
    var url = _apiURL + 'messages?id=${m.id}';
    try {
      response = await http.delete(url);
    } catch (e) {
      print(e);
      return Future.error('Failed to remove message');
    }
    if (response.statusCode == 200) return Future.value(null);
    return Future.error('Failed to remove message');
  }

  @override
  Future<void> validateUser(User u, String password) async {
    http.Response response;
    var url = _apiURL + 'users/validate?user=${u.id}&password=$password';
    try {
      response = await http.get(url);
    } catch (e) {
      print(e);
      return Future.error('User is not authorised. Server unreachable.');
    }
    if (response.statusCode == 200) return Future.value(null);
    return Future.error('User is not authorised. Server declined.');
  }
}
