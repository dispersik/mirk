import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mirk/back/entities/chat.dart';
import 'package:mirk/back/globals.dart';
import 'package:mirk/back/mirk_api/heroku_api.dart';
import 'back/bloc/chat_bloc.dart';
import 'back/bloc/message_bloc.dart';
import 'front/widgets/chat/chat.dart';
import 'front/widgets/user_list/list.dart';

void main() {
  runApp(Mirk());
}

class Mirk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>MessagesBloc()),
        BlocProvider(create: (context)=>ChatsBloc()),
      ],
      child: MaterialApp(
        title: 'Mirk',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Mirk'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDesktopView =
      (kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows)
          ? true
          : false;
  final api = HerokuAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF250028),
        appBar: AppBar(
          backgroundColor: Color(0xFF18001A),
          brightness: Brightness.dark,
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          actions: [
            IconButton(icon: Icon(Icons.file_upload), onPressed: () async {
              await api.addUserToMirk(currentUser);
              await api.addChat(savedMessages);
            },),
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              context.read<ChatsBloc>().add(ChatsEvent.getChats);
              context.read<MessagesBloc>().add(MessagesEvent.getMessages);
            })
          ],
        ),
        body: (_isDesktopView)
            ? Row(children: [
                Flexible(
                  flex: 2,
                  child: UserList(),
                ),
                Flexible(
                  flex: 7,
                  child: UserChat(),
                )
              ])
            : UserList());
  }
}
