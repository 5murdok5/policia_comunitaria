import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/models/models_custodia.dart';

class CustodiaController extends GetxController {
  late TextEditingController lugarSalidaCtrl;
  late TextEditingController lugarDestinoCtrl;
  late TextEditingController motivoSolicitud;

  final Rx<DateTime?> _fecha = DateTime.now().obs;
  DateTime? get fecha => _fecha.value;
  set fecha(DateTime? value) => _fecha.value = value;

  final Rx<TimeOfDay?> _hora = TimeOfDay.now().obs;
  TimeOfDay? get hora => _hora.value;
  set hora(TimeOfDay? value) => _hora.value = value;

  @override
  void onInit() {
    lugarSalidaCtrl = TextEditingController();
    lugarDestinoCtrl = TextEditingController();
    motivoSolicitud = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    lugarSalidaCtrl.dispose();
    lugarDestinoCtrl.dispose();
    motivoSolicitud.dispose();
    super.onClose();
  }

  Future<void> enviarCustodia() async {
    AppController appCtrl = Get.find();
    final ModelCustodia data = ModelCustodia(
      fechaCreado: DateTime.now().microsecondsSinceEpoch,
      idAgente: null,
      idUsuario: appCtrl.userData!.idUser!,
      lugarDestino: lugarDestinoCtrl.text,
      lugarSalida: lugarSalidaCtrl.text,
      motivo: motivoSolicitud.text,
    );
  }
}
