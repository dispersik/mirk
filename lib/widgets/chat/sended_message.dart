import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirk/back/message.dart';

class SendedMessage extends StatelessWidget {
  SendedMessage({@required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: Color(0xFF1C071E),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'You at ${message.time} wrote:\n\n' +
              message.text,
          style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
        ),
      ),
    );
  }
}