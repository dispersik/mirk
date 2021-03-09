import 'package:flutter/foundation.dart';

import 'message.dart';

enum MessagesStates {
  onGet,
  error,
}

class MessagesState {
  MessagesState.onGet(this.messages) {
    state = MessagesStates.onGet;
  }

  MessagesState(this.messages, {this.message});

  MessagesState.onErr(this.messages, {@required this.message}) {
    state = MessagesStates.error;
  }

  List<Message> messages;
  MessagesStates state;
  String message;
}
