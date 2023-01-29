import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/models/models.services.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompCardServ extends StatelessWidget {
  final ModelServices serv;
  final Widget? page;
  final bool? alertMode;
  const CompCardServ(
      {super.key, required this.serv, this.page, this.alertMode});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => toPage(
        page: page,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: height * 0.20,
        width: width * 0.39,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(20),
        curve: Curves.easeInOutCubic,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: serv.title == 'Emergencia'
              ? alertMode == true
                  ? Colors.red[100]
                  : Colors.amber
              : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(22, 0, 0, 0),
              blurRadius: 8.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(width * 0.06),
                decoration: BoxDecoration(
                  // color: Colors.white,
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
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
