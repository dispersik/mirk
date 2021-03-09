import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirk/back/entities/message.dart';
import 'package:mirk/back/entities/messages_state.dart';
import 'package:mirk/back/globals.dart';
import 'package:mirk/back/mirk_api/heroku_api.dart';

enum MessagesEvent { getMessages, sendMessage, deleteMessage }

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(null);
  final HerokuAPI _api = HerokuAPI();

  @override
  Stream<MessagesState> mapEventToState(MessagesEvent event) async* {
    switch (event) {
      case MessagesEvent.getMessages:
        yield MessagesState.onGet(_prevState());
        var messages;
        try {
          messages = await _api.getChatMessages(savedMessages);
        } catch(e) {
          print(e);
          yield MessagesState.onErr(_prevState(), message: e.toString());
          break;
        }
        yield MessagesState(messages);
        break;
      default:
        throw UnimplementedError();
    }
  }
  List<Message> _prevState() {
    if (state==null) return List<Message>();
    return state.messages;
  }
}
