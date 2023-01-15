import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_app_bar_home.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class Emergencia extends StatelessWidget {
  const Emergencia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      appBar: customAppbar(
        title: 'Emergencias',
        showBackButton: true,
        colorApp: kprimaryColor,
        colorText: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingHzApp + 25,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text(
              'Si se encuentra en una situación de peligro o emergencia, presiona el botón rojo, se enviará su ubicación y la grabación de su teléfono en tiempo real a la central, los agentes más cercanos a su zona acudirán a la alerta en el menor tiempo posible.',
              textAlign: TextAlign.justify,
              bottom: 10,
              color: Colors.white,
            ),
            text(
              'Recuerda hacer un uso responsable del sistema, las alertas innecesarias sancionadas.',
              type: 'subtitle',
              size: 15,
              color: Colors.white,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CircleAvatar(
              backgroundColor: Colors.redAccent,
              maxRadius: 70,
              child: text(
                'Emergencia',
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
