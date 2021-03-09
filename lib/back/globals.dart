import 'package:mirk/back/entities/chat.dart';

import 'entities/user.dart';

User currentUser = User(id: 3, nickname: "admin");
Chat savedMessages = Chat(id: 3, users: [currentUser]);