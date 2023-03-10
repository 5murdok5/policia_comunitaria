import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/LoginCtrl.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_back_button.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_button%20copy.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_input.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class PageRegister extends StatelessWidget {
  const PageRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: GestureDetector(
        onTap: () => dismisKeybr(),
        child: Scaffold(
          backgroundColor: kprimaryColor,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                FadeIn(
                  delay: const Duration(
                    milliseconds: 300,
                  ),
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  child: topSection(),
                ),
                FadeInUp(
                  delay: const Duration(
                    milliseconds: 200,
                  ),
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  child: formSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topSection() {
    return Container(
      color: kprimaryColor,
      height: height * 0.35,
      width: double.infinity,
      child: Stack(
        children: [
          const ArrowBackBtn(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/imgs/app_logo.png",
                  height: 126,
                  width: 126,
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget formSection() {
    return Container(
      height: height * 0.65,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: paddingHzApp,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          GetBuilder<LoginController>(
            init: LoginController(),
            initState: (_) {},
            builder: (_) {
              return Form(
                key: _.loginForm,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      text(
                        "Reg??strate !!",
                        type: 'subtitle',
                        top: height * 0.05,
                        bottom: height * 0.01,
                        size: 20,
                      ),
                      text(
                        "Ingresa tus datos a continuaci??n",
                        type: 'body2',
                        bottom: height * 0.04,
                      ),
                      Obx(
                        () => Input(
                          title: 'Identificaci??n',
                          controller: _.rucCtrl,
                          uppercasse: false,
                          maxLines: 1,
                          enable: !_.loadLogin,
                          padding: EdgeInsets.symmetric(
                            horizontal: paddingHzApp - 15,
                            vertical: 8,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingresa una Identificacion';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => Input(
                          title: 'Nombres',
                          controller: _.nameCtrl,
                          uppercasse: false,
                          maxLines: 1,
                          enable: !_.loadLogin,
                          padding: EdgeInsets.symmetric(
                            horizontal: paddingHzApp - 15,
                            vertical: 8,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Debes ingresar tu nombre completo';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => Input(
                          title: 'Email',
                          controller: _.emailCtrl,
                          uppercasse: false,
                          maxLines: 1,
                          enable: !_.loadLogin,
                          padding: EdgeInsets.symmetric(
                            horizontal: paddingHzApp - 15,
                            vertical: 8,
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Debes agregar un email';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Ingresa un email v??lido';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => Input(
                          title: 'Contrase??a',
                          controller: _.passCtrl,
                          uppercasse: false,
                          enable: !_.loadLogin,
                          padding: EdgeInsets.symmetric(
                            horizontal: paddingHzApp - 15,
                            vertical: 8,
                          ),
                          obscureText: _.showPass,
                          maxLines: 1,
                          suffixIcon: IconButton(
                            onPressed: () => _.viewPass(),
                            icon: Icon(
                              _.showPass
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingrese su contrase??a';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => Input(
                          title: 'Re-Contrase??a',
                          controller: _.repassCtrl,
                          uppercasse: false,
                          enable: !_.loadLogin,
                          padding: EdgeInsets.symmetric(
                            horizontal: paddingHzApp - 15,
                            vertical: 8,
                          ),
                          obscureText: _.showPass,
                          maxLines: 1,
                          suffixIcon: IconButton(
                            onPressed: () => _.viewPass(),
                            icon: Icon(
                              _.showPass
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingrese su contrase??a';
                            }
                            if (value != _.passCtrl.text) {
                              return 'Las contrase??as no son iguales';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => button(
                          'Registrarse',
                          load: _.loadLogin,
                          margin: EdgeInsets.symmetric(
                            horizontal: paddingHzApp - 15,
                            vertical: 8,
                          ),
                          onTap: () => _.registerUser(),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
