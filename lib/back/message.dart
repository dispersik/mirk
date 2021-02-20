import 'package:flutter/cupertino.dart';
import 'package:mirk/back/user.dart';

class Message {
  Message(
      {@required this.text,
      @required this.dt,
      @required this.source,
      @required this.destination});

  String text;
  DateTime dt;
  User source;
  User destination;

  String get time => '${dt.hour}:${dt.minute}';
}
