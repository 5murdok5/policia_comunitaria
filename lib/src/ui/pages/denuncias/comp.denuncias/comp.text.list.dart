import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompChatList extends StatelessWidget {
  const CompChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      reverse: true,
      itemBuilder: (context, index) {
        return messageComp(isRemited: true);
      },
    );
  }

  Widget messageComp({bool isRemited = true}) {
    return CtCard(
      color:
          isRemited ? Colors.white : const Color.fromARGB(255, 240, 255, 248),
      margin: EdgeInsets.only(
        left: isRemited ? 90 : 20,
        right: isRemited ? 20 : 90,
        top: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment:
            isRemited ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          text(
            'Magna aliqua ea ullamco dolore minim pariatur ea nostrud aute proident laborum excepteur dolore voluptate.',
            size: 13,
            textAlign: isRemited ? TextAlign.right : TextAlign.left,
            bottom: 5,
          ),
          text(
            '10:35 pm',
            type: 'body1',
            size: 10,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
