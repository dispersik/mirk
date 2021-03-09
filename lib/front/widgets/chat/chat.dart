import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mirk/back/entities/message.dart';
import 'package:mirk/back/entities/user.dart';

import 'message_builder.dart';

class UserChat extends StatelessWidget {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) =>
                buildMessage(messages[index], User(id: 1377, nickname: '^^3')),
          ),
        ),
        Container(
          height: 50,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              Expanded(
                child: TextField(
                  onSubmitted: (text) => print(text),
                  controller: _messageController,
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C071E),
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      // isDense: true,
                      // isCollapsed: true,
                      hintText: 'Enter your message',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w300)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
        ),
      ],
    );
  }
}

Message _debugMessage = Message(
    text:
    '''Агапэ — любовь всепрощающая, терпеливая и постоянная. Психологи полагают, что такие отношения, безвозмездные и построенные на глубоком доверии, проходят проверку временем.

Прообразом сторгэ стала любовь Пенелопы к Одиссею, которая, вопреки всему, дождалась своего мужа. Этому чувству присуща родительская забота, оно прочно и только усиливается со временем.

Прагма — «практическая» любовь, которая основывается на осознанном рациональном выборе партнера. И как раз потому, что прагматик прислушивается к разуму, а не к сердцу, он ценит и бережет свою половинку.

Мания — всепоглощающая эгоистическая любовь, постоянно требующая к себе внимания. Отношения в этом случае строятся по синусоиде: от подъема и восторга до падения и отчаяния.

Людус — любовная игра, когда обе стороны не придают отношениям большого значения. «Людянин» ценит свою независимость, поэтому может иметь несколько партнеров.

Эрос — сексуальное влечение, которое внезапно возникает и пропадает. Такие отношения бывают яркими и чувственными, но краткосрочными.''',
    source: User(id: 0, nickname: 'm8'),
    destination: User(id: 1377, nickname: '^^3'),
    dt: DateTime.now());

Message _msg = Message(text: 'есть такое, да', dt: DateTime.now(), source: User(id: 1377, nickname: '^^3'), destination: User(id: 0, nickname: 'm8'));

List<Message> messages = <Message>[_debugMessage, _msg];