import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_input.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class PageCustodia extends StatelessWidget {
  const PageCustodia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHzApp,
          ),
          child: Column(
            children: [
              text(
                'Para solicitar custodia policial, ingresa los datos a continuación',
              ),
              Input(
                title: 'Seleccionar Fecha',
                keyboardType: TextInputType.datetime,
              ),
              Input(
                title: 'Salida',
              ),
              Input(
                title: 'Destino',
              ),
              Input(
                title: 'Motivo de Solicitud',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
