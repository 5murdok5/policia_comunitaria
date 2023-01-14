import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class PageSearchUpc extends StatelessWidget {
  const PageSearchUpc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buttonLocation(),
      body: Stack(
        children: [
          mapContainer(),
          headerMap(),
        ],
      ),
    );
  }

  Widget mapContainer() {
    return Container(
      color: Colors.blueAccent,
    );
  }

  Widget headerMap() {
    return SafeArea(
      child: CtCard(
        margin: EdgeInsets.symmetric(horizontal: paddingHzApp, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text(
                      'Buscar UPCs por la zona',
                      type: 'subtitle',
                    ),
                    text(
                      'Encuentra Upcs cerca de donde estes.',
                      type: 'body1',
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_history_sharp,
                  color: kprimaryColor,
                ),
                Expanded(
                  child: text(
                    'Pradera, Arupos y Nogales',
                    type: 'body1',
                    left: 10,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  FloatingActionButton buttonLocation() {
    return FloatingActionButton(
      backgroundColor: kprimaryColor,
      onPressed: () {},
      child: const Icon(
        Icons.my_location_rounded,
        color: Colors.white,
      ),
    );
  }
}
