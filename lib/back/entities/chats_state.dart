import 'package:flutter/cupertino.dart';

import 'chat.dart';

enum ChatsStates {
  onGet, error,
}

class ChatsState {
  ChatsState.onGet(this.chats) {
    state = ChatsStates.onGet;
  }

  ChatsState(this.chats, {this.message});

  ChatsState.onErr(this.chats, {@required this.message}) {
    state = ChatsStates.error;
  }


  List<Chat> chats;
  ChatsStates state;
  String message;
}