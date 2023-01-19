import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/models/models.services.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompCardServ extends StatelessWidget {
  final ModelServices serv;
  const CompCardServ({super.key, required this.serv});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toPage(
        page: serv.page,
      ),
      child: CtCard(
        height: 150,
        width: width * 0.39,
        showShadow: true,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: serv.title == 'Emergencia' ? Colors.amber : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(25),
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
