import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/ui/pages/custodia/page.custodia.dart';
import 'package:policiacomunitaria/src/ui/pages/denuncias/page.denuncias.dart';
import 'package:policiacomunitaria/src/ui/pages/emergencia/page.emergencia.dart';
import 'package:policiacomunitaria/src/ui/pages/home/comp.home/comp.cardserv.dart';
import 'package:policiacomunitaria/src/ui/pages/searchUpc/page.searchupc.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompActionsHome extends StatelessWidget {
  const CompActionsHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 250, 250, 250),
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
              top: 30,
              bottom: 15,
            ),
            text(
              'Todas las alertas son monitoreadas, No uses el sistema si no es necesario, tu seguridad es nuestra responsabilidad',
              bottom: 30,
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
          listServicesMd.length,
          (index) {
            return CompCardServ(
              serv: listServicesMd[index],
              page: listPages()[index],
            );
          },
        ),
      ),
    );
  }

  List<Widget> listPages() {
    return [
      const PageSearchUpc(),
      const Emergencia(),
      // Container(),
      const PageDenuncias(),
      const PageCustodia(),
    ];
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