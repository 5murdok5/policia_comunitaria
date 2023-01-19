import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_app_bar_home.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_button.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_input.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class PageCustodia extends StatelessWidget {
  const PageCustodia({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dismisKeybr(context),
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
            child: Column(
              children: [
                text(
                  'Para solicitar custodia policial, ingresa los datos a continuación',
                  bottom: 25,
                ),
                Input(
                  title: 'Seleccionar Fecha',
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  prefixIcon: const Icon(
                    Icons.calendar_month,
                  ),
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                  },
                ),
                Input(
                  title: 'Seleccionar Hora de Salida',
                  keyboardType: TextInputType.datetime,
                  readOnly: true,
                  prefixIcon: const Icon(
                    Icons.timelapse_sharp,
                  ),
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  onTap: () async {
                    final pickedDate = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                  },
                ),
                const Input(
                  title: 'Lugar de Salida',
                  padding: EdgeInsets.all(0),
                ),
                openMapLocation(),
                const Input(
                  title: 'Lugar de Destino',
                  padding: EdgeInsets.all(0),
                ),
                openMapLocation(),
                const Input(
                  title: 'Motivo de Solicitud',
                ),
                const Button(
                  textbtn: 'Enviar Solicitud',
                  colorText: Colors.white,
                )
              ],
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
}
