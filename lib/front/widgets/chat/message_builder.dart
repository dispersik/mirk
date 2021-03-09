import 'package:flutter/material.dart';
import 'package:mirk/back/entities/message.dart';
import 'package:mirk/back/entities/user.dart';
import 'package:mirk/widgets/chat/arrived_message.dart';
import 'package:mirk/widgets/chat/sended_message.dart';

Widget buildMessage(Message message, User owner) {
  return Row(
    mainAxisAlignment: (owner.id == message.source.id)
        ? MainAxisAlignment.end
        : MainAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: (owner.id == message.source.id)
            ? SendedMessage(message: message)
            : ArrivedMessage(message: message),
      ),
    ],
  );
}
