import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/logic/repositories/custodia_repository.dart';
import 'package:policiacomunitaria/src/models/models_custodia.dart';
import 'package:policiacomunitaria/src/models/models_emergencia.dart';

class CustodiaController extends GetxController {
  final GlobalKey<FormState> custodiaForm = GlobalKey<FormState>();
  late TextEditingController lugarSalidaCtrl;
  late TextEditingController lugarDestinoCtrl;
  late TextEditingController motivoSolicitud;

  final ctreport = CustodiaRepository();

  final Rx<DateTime?> _fecha = DateTime.now().obs;
  DateTime? get fecha => _fecha.value;
  set fecha(DateTime? value) => _fecha.value = value;

  final Rx<TimeOfDay?> _hora = TimeOfDay.now().obs;
  TimeOfDay? get hora => _hora.value;
  set hora(TimeOfDay? value) => _hora.value = value;

  final _loadSend = false.obs;
  get loadSend => _loadSend.value;
  set loadSend(value) => _loadSend.value = value;

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

  int getFechaSolicitud() =>
      DateTime(fecha!.year, fecha!.month, fecha!.day, hora!.hour, hora!.minute)
          .millisecondsSinceEpoch;

  clearForm() {
    lugarSalidaCtrl.text = '';
    lugarDestinoCtrl.text = '';
    motivoSolicitud.text = '';
    custodiaForm.currentState!.reset();
  }

  Future<void> enviarCustodia() async {
    if (custodiaForm.currentState!.validate()) {
      dismisKeybr();
      showToast('Enviando solicitud, espere...', type: 'load');
      AppController appCtrl = Get.find();
      final ModelCustodia data = ModelCustodia(
        fechaCreado: DateTime.now().millisecondsSinceEpoch,
        idAgente: '',
        idUsuario: appCtrl.userData!.idUser!,
        lugarDestino: lugarDestinoCtrl.text,
        lugarSalida: lugarSalidaCtrl.text,
        motivo: motivoSolicitud.text,
        estado: 'EN_ESPERA',
        fechaSalida: getFechaSolicitud(),
        history: [
          History(
            detalle: 'Solicitud en ESPERA',
            fecha: DateTime.now().millisecondsSinceEpoch,
          )
        ],
      );
      loadSend = true;
      final resp = await ctreport.sendCustodiaSolicitud(data);
      if (resp != null) {
        appCtrl.listCustodias.add(resp);
        showToast(
          'Solicitud de Custodia Enviada, Enviada',
          type: 'success',
        );
        clearForm();
      }
      loadSend = false;
    }
  }
}
