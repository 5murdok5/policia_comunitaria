import 'dart:developer';

import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global_sharedpreferences.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/models/models.user.dart';

class UserRepository {
  Future<UserModel?> checkUserDataStorage() async {
    return await getUserSt();
  }

  Future<UserModel> setUserStorage(UserModel user) async {
    return await setUserSt(user);
  }

  Future<UserModel?> getUserDataFromDB(String idUser) async {
    try {
      return await db
          .collection('usuarios')
          .doc(idUser.trim())
          .get()
          .then((value) => UserModel.fromMap(value.data()!))
          .catchError((e) {
        log('error get user data!!: $e');
      });
    } catch (e) {
      showToast(
        'No fue posible consultar los datos de usuario',
        title: 'Usuario no Encontrado',
      );
      return null;
    }
  }
}
