import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/ServicesCtrl.dart';
import 'package:policiacomunitaria/src/ui/pages/home/comp.home/comp.cardserv.dart';
import 'package:policiacomunitaria/src/ui/pages/home/comp.home/comp_list_solictudes.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompActionsHome extends StatelessWidget {
  CompActionsHome({super.key});
  final ServicesController ctrlServs = Get.put(ServicesController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: paddingHzApp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            text(
              'Selcciona Un Servicio',
              type: 'subtitle',
              top: 20,
              bottom: 10,
            ),
            text(
              'Todas las alertas son monitoreadas, No uses el sistema si no es necesario, tu seguridad es nuestra responsabilidad',
            ),
            listServicesComp(),
            // const CompListSolicitudes(),
          ],
        ),
      ),
    );
  }

  Widget listServicesComp() {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: List.generate(
          ctrlServs.listServices.length,
          (index) {
            return CompCardServ(serv: ctrlServs.listServices[index]);
          },
        ),
      ),
    );
  }
}













//? MODO LISTA
       // Expanded(
          //   child: GridView.count(
          //     physics: const BouncingScrollPhysics(),
          //     crossAxisCount: 2,
          // padding: EdgeInsets.symmetric(
          //   horizontal: paddingHzApp,
          //   vertical: paddingHzApp,
          // ),
          //     children: List.generate(
          // ctrlServs.listServices.length,
          // (index) {
          //   return CompCardServ(serv: ctrlServs.listServices[index]);
          // },
          //     ),
          //   ),
          // ),