import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global_sharedpreferences.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/logic/repositories/location_repository.dart';
import 'package:policiacomunitaria/src/models/models_emergencia.dart';
import 'package:policiacomunitaria/src/ui/widgets/widget_alert.dart';

class EmergenciaRepository {
  Future<EmergenciaModel?> sendEmergSolicitud(
    String userId,
    Location ubicacionUsuario,
  ) async {
    try {
      final String idEmergencia = db.collection('emergencia').doc().id;
      await LocationRepository().getNameStreetLtLg(ubicacionUsuario);
      EmergenciaModel emergenciaData = EmergenciaModel(
        estado: 'ESPERA',
        fechaSolicitud: DateTime.now().microsecondsSinceEpoch,
        idEmergencia: idEmergencia,
        idUsuario: userId,
        urlAudio:
            'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        idUsuarioRespuesta: '',
        ubicacionUsuario: ubicacionUsuario,
        history: [
          History(
            detalle: 'Solicitud de Emergencia CREADA',
            fecha: DateTime.now().millisecondsSinceEpoch,
          ),
        ],
      );
      return await db
          .collection('emergencia')
          .doc(idEmergencia)
          .set(emergenciaData.toMap())
          .then(
            (value) => emergenciaData,
          )
          .timeout(
            const Duration(seconds: 8),
            onTimeout: () => EmergenciaModel(),
          );
    } catch (e) {
      log('Error al enviar solicitud de emergencia $e');
      showToast('No fue posible registrar este usuario, intente mas tarde: $e');
      return null;
    }
  }

  Future<bool> changeStatusSolicitud(
    String idEmergencia,
    String estado,
  ) async {
    try {
      return await db
          .collection('emergencia')
          .doc(idEmergencia)
          .update({
            'estado': estado.toUpperCase(),
            'history': FieldValue.arrayUnion([
              History(
                detalle: 'Estado: ${estado.toUpperCase()}',
                fecha: DateTime.now().millisecondsSinceEpoch,
              ).toMap()
            ])
          })
          .then(
            (value) => true,
          )
          .timeout(
            const Duration(seconds: 8),
            onTimeout: () => false,
          );
    } catch (e) {
      log('Error al cambiar de estado Emergencia $e');
      showToast('No fue posible cambiar el estado de la solicitud: $e');
      return false;
    }
  }

  Future<void> cancelarAlert() async {
    AppController appCtrl = Get.find();
    cancelSolicitudEmergencia() async {
      showToast('Cancelando solicitud, espere...', type: 'load');
      final idSolicitud = await getidEmergenciaSt();
      final resp = await changeStatusSolicitud(
        idSolicitud,
        'CANCELADA',
      );
      if (resp == true) {
        appCtrl.changeStatusEmergency(false);
        showToast('Solicitud de Emergencia finalizada');
      }
    }

    showAlert(
      title: 'Esta seguro de cancelar la solicitud?',
      onAcept: () => cancelSolicitudEmergencia(),
      onCancel: () {},
      textAcept: 'Si',
      textCancel: 'No',
    );
  }
}
