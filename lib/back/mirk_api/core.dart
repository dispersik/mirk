import "dart:async";

import 'package:mirk/back/entities/chat.dart';
import '../entities/message.dart';
import '../entities/user.dart';

abstract class MirkAPIProvider {
  Future<List<Message>> getChatMessages(Chat c);
  Future<List<Chat>> getAllChats(User s);
  Future<void> sendMessage(Message m);
  Future<void> addUserToMirk(User u);
  Future<void> addChat(Chat c);
  Future<void> removeChat(Chat c);
  Future<void> removeMessage(Message m);
  Future<void> validateUser(User u, String s);
}