import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirk/widgets/dialogs/user_list_tile.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1C071E),
      child: ListView(
        children: [
          UserListTile('Saved'),
          for (var i =0; i<=50; i++) UserListTile('MY SuPER BRO #$i')
        ],
      ),
    );
  }
}