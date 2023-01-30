import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/actions/actions.dateformat.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/models/models_custodia.dart';
import 'package:policiacomunitaria/src/theme/theme.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_card.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_text.dart';

class CompListSolicitudes extends StatelessWidget {
  CompListSolicitudes({super.key});
  final AppController _appCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _appCtrl.listCustodias.isEmpty
          ? const SizedBox()
          : FadeIn(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        height: 50,
                        color: kprimaryColor,
                        thickness: 0.8,
                      ),
                    ),
                    text(
                      'Solicitudes de Custodia',
                      type: 'subtitle',
                      // top: 20,
                      bottom: 15,
                    ),
                    listCustodias(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget listCustodias() {
    return Obx(
      () => Column(
        children: List.generate(
          _appCtrl.listCustodias.length,
          (index) => cardCustodia(
            index,
            _appCtrl.listCustodias[0],
          ),
        ),
      ),
    );
  }

  Widget cardCustodia(int int, ModelCustodia custodia) {
    return CtCard(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 15,
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
                'Solicitud # ${int + 1}',
                type: 'subtitle',
              ),
              text(
                formatDate(
                  time: DateTime.fromMillisecondsSinceEpoch(
                    custodia.fechaCreado!,
                  ),
                ),
                size: 13,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          info(custodia.lugarSalida!),
          info(custodia.lugarDestino!),
          statusCard(custodia.estado),
        ],
      ),
    );
  }

  Widget info(String data) {
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
            data,
            size: 13,
            left: 6,
          ),
        ],
      ),
    );
  }

  Widget statusCard(String textStatus) {
    final typestatus = statusColors(textStatus);

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
