import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirk/back/entities/chat.dart';
import 'package:mirk/back/entities/chats_state.dart';
import 'package:mirk/back/entities/user.dart';
import 'package:mirk/back/mirk_api/heroku_api.dart';

import '../globals.dart';

enum ChatsEvent { getChats, createChat, deleteChat }

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() : super(null);
  final HerokuAPI _api = HerokuAPI();

  @override
  Stream<ChatsState> mapEventToState(ChatsEvent event) async* {
    switch (event) {
      case ChatsEvent.getChats:
        yield ChatsState.onGet(_prevState());
        var chats;
        try {
          chats = await _api.getAllChats(currentUser);
        } catch(e) {
          print(e);
          yield ChatsState.onErr(_prevState(), message: e.toString());
          break;
        }
        yield ChatsState(chats);
        break;
      default:
        throw UnimplementedError();
    }
  }
  List<Chat> _prevState() {
    if (state==null) return <Chat>[];
    return state.chats;
  }
}
