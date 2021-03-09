import 'package:flutter/cupertino.dart';

class User {
  User({@required this.id, @required this.nickname});

  User.fromResponse(map) {
    id = int.tryParse(map['id']);
    nickname = map['nickname'];
  }

  int id;

  String nickname;

  Map<String, String> toMap() {
    var map = Map<String, String>();
    map['id'] = id.toString();
    map['nickname'] = nickname;
    return map;
  }
}
