import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/MapCtrl.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/pages/searchUpc/comp.searchUpc/comp.map_cont.dart';
import 'package:policiacomunitaria/src/ui/pages/searchUpc/comp.searchUpc/comp.upcInfo.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class PageSearchUpc extends StatelessWidget {
  const PageSearchUpc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapDtController>(
        init: MapDtController(),
        initState: (_) {},
        builder: (_) {
          return Stack(
            children: [
              MapComp(),
              Align(
                alignment: Alignment.bottomCenter,
                child: infoCard(),
              ),
              headerMap(),
            ],
          );
        },
      ),
    );
  }

  Widget headerMap() {
    return SafeArea(
      child: CtCard(
        color: kprimaryColor,
        showShadow: true,
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
                    color: Colors.white,
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
                      color: Colors.white,
                    ),
                    text(
                      'Encuentra Upcs cerca de donde estes.',
                      type: 'body1',
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
              height: 11,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_history_sharp,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: text(
                      'Pradera, Arupos y Nogales',
                      type: 'body1',
                      left: 10,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoCard() {
    MapDtController mpctrl = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: CompUpcsInfo()),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            backgroundColor: kprimaryColor,
            onPressed: () => mpctrl.goMyLocation(),
            child: const Icon(
              Icons.my_location_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
