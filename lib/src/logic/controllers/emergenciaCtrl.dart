import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global_sharedpreferences.dart';
import 'package:policiacomunitaria/src/logic/controllers/MapCtrl.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/logic/repositories/emergencia_repository.dart';
import 'package:policiacomunitaria/src/models/models_emergencia.dart';

class EmergenciaController extends GetxController {
  final emgRepo = EmergenciaRepository();
  final AppController appCtrl = Get.find();

  sendSolictudEmergencia() async {
    showToast('Enviando solicitud, espere...', type: 'load');
    final user = appCtrl.userData!;
    final solicitud = await emgRepo.sendEmergSolicitud(
      user.idUser!,
      Location(latitude: myLocation.latitude, longitude: myLocation.longitude),
    );
    if (solicitud == null) {
      appCtrl.modeAlert = false;
    } else {
      appCtrl.modeAlert = true;
      await setidEmergenciaSt(solicitud.idEmergencia!);
      showToast(
        'Solicitud de emergencia, enviada',
        type: 'success',
      );
      Future.delayed(
        const Duration(seconds: 2),
        () => showToast(
          'Modo emergencia ACTIVADO',
          type: 'warning',
        ),
      );
    }
  }
}
