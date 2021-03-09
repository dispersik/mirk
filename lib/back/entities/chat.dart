import 'package:flutter/cupertino.dart';
import 'package:mirk/back/entities/user.dart';

class Chat {
  Chat({@required this.id, @required this.users});
  Chat.fromResponse(map) {
    id = int.tryParse(map['id']);
    users = <User>[];
    map['users'].forEach((user) {
      users.add(User.fromResponse(user));
    });
  }
  int id;
  List<User> users;
}