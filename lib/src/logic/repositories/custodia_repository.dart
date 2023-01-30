import 'dart:developer';

import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/models/models_custodia.dart';

class CustodiaRepository {
  Future<ModelCustodia?> sendCustodiaSolicitud(ModelCustodia custodia) async {
    try {
      final String idCustodia = db.collection('custodia').doc().id;
      custodia.idCustodia = idCustodia;
      return await db
          .collection('custodia')
          .doc(idCustodia)
          .set(custodia.toMap())
          .then(
            (value) => custodia,
          )
          .timeout(
            const Duration(seconds: 8),
            onTimeout: () => ModelCustodia(estado: 'ERROR'),
          );
    } catch (e) {
      log('Error al enviar custodia $e');
      showToast('No fue enviar solicitud de custodia, intente más tarde : $e');
      return null;
    }
  }

  Future<List<ModelCustodia>>? getCustodias(String idUser) async {
    try {
      return await db
          .collection('custodia')
          .where('idUsuario', isEqualTo: idUser)
          .get()
          .then(
            (value) => value.docs
                .map(
                  (e) => ModelCustodia.fromMap(
                    e.data(),
                  ),
                )
                .toList(),
          )
          .timeout(
            const Duration(seconds: 8),
            onTimeout: () => [],
          );
    } catch (e) {
      log('Error al obtener solicitudes $e');
      showToast('No fué posible consultar las solicitudes: $e');
      return [];
    }
  }
}
