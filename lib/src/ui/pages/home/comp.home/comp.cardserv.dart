import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/models/models.services.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompCardServ extends StatelessWidget {
  final ModelServices serv;
  final Widget? page;
  const CompCardServ({super.key, required this.serv, this.page});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toPage(
        page: page,
      ),
      child: CtCard(
        height: height * 0.20,
        width: width * 0.39,
        showShadow: true,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        color: serv.title == 'Emergencia' ? Colors.amber : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(width * 0.06),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      serv.iconService!,
                    ),
                  ),
                ),
              ),
            ),
            text(
              serv.title!,
              type: 'subtitle',
            ),
          ],
        ),
      ),
    );
  }
}
