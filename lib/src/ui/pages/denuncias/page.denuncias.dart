import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
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
        body: Column(
          children: const [
            Expanded(
              child: CompChatList(),
            ),
            CompInptChat(),
          ],
        ),
      ),
    );
  }
}
