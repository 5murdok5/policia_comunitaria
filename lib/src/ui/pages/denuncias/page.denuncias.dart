import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/chatCtrl.dart';
import 'package:policiacomunitaria/src/ui/pages/denuncias/comp.denuncias/comp.input.dart';
import 'package:policiacomunitaria/src/ui/pages/denuncias/comp.denuncias/comp.text.list.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_app_bar_home.dart';

class PageDenuncias extends StatelessWidget {
  const PageDenuncias({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      initState: (_) {},
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            _.showAlertExit();
            return false;
          },
          child: GestureDetector(
            onTap: () => dismisKeybr(),
            child: Scaffold(
              appBar: customAppbar(
                title: 'Denuncias',
                colorApp: const Color.fromARGB(255, 234, 237, 247),
                showBackButton: true,
                onpressbackbtn: () {
                  _.showAlertExit();
                },
              ),
              resizeToAvoidBottomInset: true,
              backgroundColor: const Color.fromARGB(255, 234, 237, 247),
              body: Column(
                children: [
                  Expanded(
                    child: CompChatList(),
                  ),
                  CompInptChat(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
