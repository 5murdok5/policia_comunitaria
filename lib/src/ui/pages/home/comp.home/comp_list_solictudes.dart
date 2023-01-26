import 'package:flutter/material.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompListSolicitudes extends StatelessWidget {
  const CompListSolicitudes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(
          'Solicitudes de Custodia',
          type: 'subtitle',
          top: 20,
          bottom: 15,
        ),
        listCustodias(),
      ],
    );
  }

  Widget listCustodias() {
    return Column(
      children: List.generate(
        3,
        (index) => cardCustodia(),
      ),
    );
  }

  Widget cardCustodia() {
    return CtCard(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      showShadow: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(
                'Solicitud # 1',
                type: 'subtitle',
              ),
              text(
                '12/11/2023 10H40',
                size: 13,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          info(),
          info(),
          statusCard(),
        ],
      ),
    );
  }

  Widget info() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          const Icon(
            Icons.location_off,
            color: Colors.grey,
            size: 15,
          ),
          text(
            'Solicitud # 1',
            size: 13,
            left: 6,
          ),
        ],
      ),
    );
  }

  Widget statusCard() {
    final typestatus = statusColors('EN_ESPERA');

    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: typestatus["backColor"],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: text(
          'En Espera',
          color: typestatus["textColor"],
          top: 6,
          bottom: 6,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  statusColors(String type) {
    switch (type) {
      case 'EN_ESPERA':
        return {
          "textColor": const Color.fromARGB(255, 0, 73, 133),
          'backColor': const Color.fromARGB(57, 0, 73, 133),
        };
      case 'ACEPTADA':
        return {
          "textColor": const Color.fromARGB(255, 82, 255, 140),
          'backColor': const Color.fromARGB(57, 82, 255, 140),
        };
      case 'RECHAZADA':
        return {
          "textColor": const Color.fromARGB(255, 255, 7, 123),
          'backColor': const Color.fromARGB(57, 255, 7, 123),
        };
      default:
    }
  }
}
