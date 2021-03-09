import 'package:flutter/material.dart';

class UserListTile extends StatelessWidget {
  UserListTile(this.name);

  final name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.5),
            child: Container(height: 25, width: 25, color: Color(0xFF8C2593),),
          ),
          Flexible(child: Text(
            name,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
          ),),

        ],
      ),
    );
  }
}
