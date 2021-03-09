import 'dart:async';
import 'package:mirk/back/entities/message.dart';
import 'package:mirk/back/mirk_api/core.dart';
import 'package:mirk/back/entities/user.dart';


class Repository {
  @override
  Future<List<Message>> getMessages(User dest) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

}