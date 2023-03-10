import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/logic/repositories/auth_repository.dart';
import 'package:policiacomunitaria/src/logic/repositories/emergencia_repository.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/pages/home/comp.home/comp.cont_actions.dart';
import 'package:policiacomunitaria/src/ui/pages/home/comp.home/comp.home_header.dart';
import 'package:policiacomunitaria/src/ui/pages/informacionUsuario/page.informacionusuario.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final AppController appCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(
        () => Scaffold(
          key: scaffoldKey,
          backgroundColor: appCtrl.modeAlert ? Colors.redAccent : kprimaryColor,
          floatingActionButton:
              appCtrl.modeAlert ? btnCancelSolicitud() : const SizedBox(),
          drawer: drawerMenu(),
          body: SafeArea(
            child: Column(
              children: [
                CompHeader(keyscf: scaffoldKey),
                SizedBox(
                  height: height * 0.04,
                ),
                const Expanded(
                  child: CompActionsHome(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget drawerMenu() {
    return CtCard(
      color: kprimaryColor,
      width: width * 0.6,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.04,
            ),
            headerDrawer(),
            SizedBox(
              height: height * 0.04,
            ),
            optionCont(
                icon: Icons.emoji_people_sharp,
                nameOption: 'Informaci??n de Usuario', () {
              Get.back();
              toPage(
                page: const InformacionUsuario(),
              );
            }),
            optionCont(
              icon: Icons.exit_to_app,
              nameOption: 'Cerrar Sesi??n',
              () => AuthReposiry().logOutuser(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: text(
                  'v 1.0.0',
                  color: Colors.grey,
                  bottom: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget optionCont(void Function()? onTap,
      {required IconData icon, required String nameOption}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            Expanded(
              child: text(
                nameOption,
                color: Colors.white,
                left: 10,
                right: 10,
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 15,
            )
          ],
        ),
      ),
    );
  }

  Widget btnCancelSolicitud() {
    return FadeIn(
      child: InkWell(
        onTap: () => EmergenciaRepository().cancelarAlert(),
        child: CtCard(
          color: Colors.redAccent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flash(
                duration: const Duration(seconds: 3),
                infinite: true,
                child: const Icon(
                  Icons.emergency,
                  color: Colors.white,
                ),
              ),
              text(
                'Cancelar Emergencia',
                color: Colors.white,
                left: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget headerDrawer({
  Color textColor = Colors.white,
}) {
  return Column(
    children: [
      Image.asset(
        "assets/imgs/app_logo.png",
        height: 80,
        width: 80,
      ),
      text(
        'Policia Comunitaria',
        type: 'subtitle',
        color: textColor,
        top: 20,
      ),
      text(
        'Al servicio de la comunidad',
        color: textColor.withAlpha(190),
        top: 5,
      ),
    ],
  );
}
