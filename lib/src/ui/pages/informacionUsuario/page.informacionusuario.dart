import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/userinfoCtrl.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/pages/home/page.home.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_app_bar_home.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_input.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: 'Información de Usuario',
        showBackButton: true,
        colorApp: kprimaryColor,
        colorText: Colors.white,
      ),
      body: GetBuilder<UserInfoController>(
        init: UserInfoController(),
        initState: (_) {},
        builder: (_) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHzApp,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                informacionUsuario(
                  'Ruc/Cédula',
                  _.rucCtrl,
                ),
                informacionUsuario(
                  'Nombres',
                  _.nameCtrl,
                ),
                informacionUsuario(
                  'Usuario',
                  _.emailCtrl,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Divider(
                    color: kprimaryColor,
                    height: 0.7,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                headerDrawer(
                  textColor: kprimaryColor,
                ),
                text(
                  'v 1.0.1',
                  top: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget informacionUsuario(String title, TextEditingController? controller) {
    return Input(
      controller: controller,
      title: title,
      enable: false,
    );
  }
}
