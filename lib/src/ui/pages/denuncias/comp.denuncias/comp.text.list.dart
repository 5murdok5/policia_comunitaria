import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/UserCtrl.dart';
import 'package:policiacomunitaria/src/logic/controllers/chatCtrl.dart';
import 'package:policiacomunitaria/src/models/models.message.dart';
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
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return messageComp(
            isMine:
                userCtrl.userDt.idUser == smsCtrl.listMessages[index].idUser,
            message: smsCtrl.listMessages[index],
          );
        },
      ),
    );
  }

  Widget messageComp({bool isMine = true, MessageModel? message}) {
    return Row(
      mainAxisAlignment:
          isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        IntrinsicWidth(
          child: Container(
            constraints: BoxConstraints(maxWidth: width / 1.3),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: isMine
                  ? Colors.white
                  : const Color.fromARGB(255, 240, 255, 248),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                text(
                  message?.message ?? 'sms',
                  size: 14,
                ),
                Align(
                  alignment:
                      !isMine ? Alignment.centerLeft : Alignment.centerRight,
                  child: text(
                    '10:35 pm',
                    top: 5,
                    type: 'body1',
                    size: 11,
                    color: const Color.fromARGB(255, 87, 87, 87),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
