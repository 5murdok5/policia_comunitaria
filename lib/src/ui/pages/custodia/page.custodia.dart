import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/actions/actions.dateformat.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/CustodiaCtrl.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_app_bar_home.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_button.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_input.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class PageCustodia extends StatelessWidget {
  const PageCustodia({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismisKeybr(),
      child: Scaffold(
        appBar: customAppbar(
          title: 'Custodia',
          showBackButton: true,
          colorApp: kprimaryColor,
          colorText: Colors.white,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHzApp,
              vertical: height * 0.02,
            ),
            child: GetBuilder<CustodiaController>(
              init: CustodiaController(),
              initState: (_) {},
              builder: (_) {
                return Column(
                  children: [
                    text(
                      'Para solicitar custodia policial, ingresa los datos a continuación',
                      bottom: 25,
                    ),

                    Obx(
                      () => btnSelectDate(
                        (_.fecha == null
                                ? 'Seleccionar Fecha'
                                : formatDate(
                                    time: _.fecha ?? DateTime.now(),
                                    dateOnly: true,
                                  ))
                            .toString(),
                        Icons.calendar_month,
                        onTap: () async {
                          _.fecha = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date

                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2040),
                          );
                        },
                      ),
                    ),

                    Obx(
                      () => btnSelectDate(
                        (_.hora == null
                                ? 'Seleccionar Fecha'
                                : formatTime(
                                    time: _.hora!,
                                    dateOnly: true,
                                  ))
                            .toString(),
                        Icons.timelapse_sharp,
                        onTap: () async {
                          _.hora = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                      ),
                    ),

                    Input(
                      title: 'Lugar de Salida',
                      controller: _.lugarSalidaCtrl,
                      prefixIcon: const Icon(
                        Icons.location_city,
                      ),
                      // padding: EdgeInsets.all(0),
                    ),
                    // openMapLocation(),
                    Input(
                      title: 'Lugar de Destino',
                      controller: _.lugarDestinoCtrl,
                      prefixIcon: const Icon(
                        Icons.location_on,
                      ),
                      // padding: EdgeInsets.all(0),
                    ),
                    // openMapLocation(),
                    Input(
                      title: 'Motivo de Solicitud',
                      controller: _.motivoSolicitud,
                      prefixIcon: const Icon(
                        Icons.info,
                      ),
                    ),
                    const Button(
                      textbtn: 'Enviar Solicitud',
                      colorText: Colors.white,
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget openMapLocation() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => {},
        child: text('Seleccionar en Mapa'),
      ),
    );
  }

  Widget btnSelectDate(String title, IconData? icon, {void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: CtCard(
        color: Colors.transparent,
        showborder: true,
        radius: 10,
        borderColor: Colors.grey[600],
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey[600],
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(child: text(title)),
            const Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
