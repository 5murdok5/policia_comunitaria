import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/chatCtrl.dart';
import 'package:policiacomunitaria/src/ui/pages/denuncias/comp.denuncias/comp.input.dart';
import 'package:policiacomunitaria/src/ui/pages/denuncias/comp.denuncias/comp.text.list.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_app_bar_home.dart';

class PageDenuncias extends StatelessWidget {
  const PageDenuncias({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismisKeybr(ctx),
      child: Scaffold(
        appBar: customAppbar(
          title: 'Denuncias',
          colorApp: const Color.fromARGB(255, 234, 237, 247),
          showBackButton: true,
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 234, 237, 247),
        body: GetBuilder<ChatController>(
          init: ChatController(),
          initState: (_) {},
          builder: (_) {
            return Column(
              children: [
                Expanded(
                  child: CompChatList(),
                ),
                CompInptChat(),
              ],
            );
          },
        ),
      ),
    );
  }
}
