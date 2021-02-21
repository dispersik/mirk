import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mirk/widgets/chat/chat.dart';
import 'package:mirk/widgets/dialogs/user_list.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(Mirk());
}

class Mirk extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mirk',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mirk'),
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
  bool _isDesktopView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF250028),
        appBar: AppBar(
          backgroundColor: Color(0xFF18001A),
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        body: (_isDesktopView)
            ? Row(children: [
                Flexible(flex: 2,
                  child: UserList(),
                ),
                Flexible(
                  flex: 7,
                  child: UserChat(),
                )
              ])
            : Center(child: CircularProgressIndicator()));
  }
}
