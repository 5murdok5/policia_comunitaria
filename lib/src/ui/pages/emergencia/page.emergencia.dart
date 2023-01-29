import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/emergenciaCtrl.dart';
import 'package:policiacomunitaria/src/logic/repositories/emergencia_repository.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_app_bar_home.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_expanded_animation.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class Emergencia extends StatelessWidget {
  const Emergencia({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmergenciaController>(
      init: EmergenciaController(),
      initState: (_) {},
      builder: (_) {
        return Obx(
          () => Scaffold(
            backgroundColor:
                _.appCtrl.modeAlert ? KmodeALertColor : kprimaryColor,
            appBar: customAppbar(
              title: 'Emergencias',
              showBackButton: true,
              colorApp: _.appCtrl.modeAlert ? KmodeALertColor : kprimaryColor,
              colorText: Colors.white,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: paddingHzApp + 25,
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExpandedSection(
                      expand: !_.appCtrl.modeAlert,
                      child: infoHeadSection(),
                    ),
                    InkWell(
                      onTap: () => _.sendSolictudEmergencia(),
                      child: CircleAvatar(
                        backgroundColor: _.appCtrl.modeAlert
                            ? Colors.white
                            : Colors.redAccent,
                        maxRadius: 70,
                        child: _.appCtrl.modeAlert
                            ? imgOnEmergency()
                            : text(
                                'Emergencia',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    AnimatedScale(
                      duration: const Duration(milliseconds: 400),
                      scale: _.appCtrl.modeAlert ? 1 : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: InkWell(
                          onTap: () => EmergenciaRepository().cancelarAlert(),
                          child: const CircleAvatar(
                            backgroundColor: kprimaryColor,
                            child: Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget infoHeadSection() {
    return Column(
      children: [
        text(
          'Si se encuentra en una situación de peligro o emergencia, presiona el botón rojo, se enviará su ubicación y la grabación de su teléfono en tiempo real a la central, los agentes más cercanos a su zona acudirán a la alerta en el menor tiempo posible.',
          textAlign: TextAlign.justify,
          bottom: 10,
          color: Colors.white,
        ),
        const Divider(
          color: Colors.white,
          height: 30,
          thickness: 0.7,
        ),
        text(
          'Recuerda hacer un uso responsable del sistema, las alertas innecesarias sancionadas.',
          type: 'subtitle',
          textAlign: TextAlign.center,
          size: 15,
          color: Colors.white,
        ),
        SizedBox(
          height: height * 0.05,
        ),
      ],
    );
  }

  Widget imgOnEmergency() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Image.asset(
            "assets/imgs/audio_emergenci.gif",
            // height: 126,
            width: 126,
          ),
        ),
        text(
          'Enviando Audio',
          type: 'body1',
          size: 12,
        )
      ],
    );
  }
}
