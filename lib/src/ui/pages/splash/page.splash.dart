import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/pages/login/page.login.dart';
import 'package:policiacomunitaria/src/ui/pages/login/page_register.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_button%20copy.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_expanded_animation.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class PageSplash extends StatelessWidget {
  const PageSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHzApp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/imgs/app_logo.png",
                height: 126,
                width: 126,
              ),
              GetBuilder<AppController>(
                init: AppController(),
                builder: (controller) {
                  return Obx(
                    () => ExpandedSection(
                      expand: controller.userData?.idUser == null,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text(
                              'Policia Comunitaria',
                              type: 'subtitle',
                              color: Colors.white,
                              top: 20,
                            ),
                            text(
                              'Al servicio de la comunidad',
                              color: const Color.fromARGB(207, 255, 255, 255),
                              top: 5,
                            ),
                            FadeIn(
                              delay: const Duration(
                                milliseconds: 600,
                              ),
                              child: button(
                                'Iniciar Sesión',
                                margin: EdgeInsets.symmetric(
                                  horizontal: paddingHzApp + 15,
                                  vertical: 20,
                                ),
                                type: 'light_primary',
                                onTap: () => toPage(
                                  page: const PageLogin(),
                                ),
                              ),
                            ),
                            FadeIn(
                              delay: const Duration(
                                milliseconds: 700,
                              ),
                              child: button(
                                'Registrarse',
                                margin: EdgeInsets.symmetric(
                                  horizontal: paddingHzApp + 15,
                                ),
                                type: 'light_primary',
                                onTap: () => toPage(
                                  page: const PageRegister(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
