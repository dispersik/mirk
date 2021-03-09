import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirk/back/bloc/chat_bloc.dart';
import 'package:mirk/back/entities/chat.dart';
import 'package:mirk/back/entities/chats_state.dart';
import 'package:mirk/front/widgets/user_list/tile.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(builder: (context, state) {
      return Container(
        color: Color(0xFF1C071E),
        child: (state == null || state.state == ChatsStates.onGet)
            ? SizedBox.expand(child: Center(child: CircularProgressIndicator()))
            : ListView.builder(
                itemCount: state.chats.length,
                itemBuilder: chatsBuilder,
              ),
      );
    });
  }

  Widget chatsBuilder(BuildContext context, int index) {
    var chat = context.read<ChatsBloc>().state.chats[index];
    return UserListTile('Chat with ${chat.users[0]}');
  }
}
