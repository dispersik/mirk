import 'package:flutter/cupertino.dart';
import 'package:mirk/back/entities/user.dart';

class Message {
  Message(
      {@required this.text,
      @required this.dt,
      @required this.source,
      @required this.destination,
      this.id});

  Message.fromResponse(map) {
    id = map['id'];
    text = map['txt'];
    dt = DateTime.tryParse(map['dt']);
    source = User.fromResponse(map['src']);
    destination = User.fromResponse(map['dest']);
  }

  String text;
  DateTime dt;
  User source;
  User destination;
  int id;

  String get time => '${dt.hour}:${dt.minute}';

  Map<String, String> toMap() {
    var map = Map<String, String>();
    map['txt'] = text;
    map['dt'] = dt.toString();
    map['src'] = source.id.toString();
    map['dest'] = destination.id.toString();
    return map;
  }

  void setIdFromResponse(String body) {
    var lines = body.split("\n");
    id = int.tryParse(lines[0].substring(lines[0].indexOf(' ')));
  }
}
