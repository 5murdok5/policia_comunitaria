import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/models/models_emergencia.dart' as model;

class LocationRepository {
  Future<Placemark?> getNameStreetLtLg(model.Location locationUser) async {
    try {
      List<Placemark> street = await placemarkFromCoordinates(
          locationUser.latitude, locationUser.longitude);
      log(street.toString());
      if (street.isNotEmpty) {
        return street.first;
      }
      return null;
    } catch (e) {
      log('Error obtener calles');
      showToast('no fue posible obtener esta direccion, intente de nuevo',
          type: 'error');
      return null;
    }
  }
}
