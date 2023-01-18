import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/logic/controllers/UserCtrl.dart';
import 'package:policiacomunitaria/src/logic/controllers/chatCtrl.dart';
import 'package:policiacomunitaria/src/models/models.message.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompChatList extends StatelessWidget {
  CompChatList({super.key});
  final ChatController smsCtrl = Get.find();
  final UserController userCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: smsCtrl.listMessages.length,
        itemBuilder: (context, index) {
          return messageComp(
            isRemited:
                userCtrl.userDt.idUser == smsCtrl.listMessages[index].idUser,
            message: smsCtrl.listMessages[index],
          );
        },
      ),
    );
  }

  Widget messageComp({bool isRemited = true, MessageModel? message}) {
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
            message?.message ?? 'No Sms',
            size: 13,
            textAlign: isRemited ? TextAlign.right : TextAlign.left,
            bottom: 5,
          ),
          Align(
            alignment: isRemited ? Alignment.centerLeft : Alignment.centerRight,
            child: text(
              '10:35 pm',
              type: 'body1',
              size: 10,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
