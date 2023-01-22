import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/chatCtrl.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_input.dart';

class CompInptChat extends StatelessWidget {
  CompInptChat({super.key});
  final ChatController ctrlChat = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
            left: paddingHzApp - 10, right: paddingHzApp - 10, top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Input(
                controller: ctrlChat.messageInpCtrl,
                title: 'Escribir Mensaje...',
                // suffixIcon: Transform.rotate(
                //   angle: -10,
                //   child: const Icon(
                //     Icons.attachment_outlined,
                //   ),
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 10),
              child: GestureDetector(
                onTap: () => ctrlChat.sendMessage(),
                child: const CircleAvatar(
                  backgroundColor: kprimaryColor,
                  child: Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
