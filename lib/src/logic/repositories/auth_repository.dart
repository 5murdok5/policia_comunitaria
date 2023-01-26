import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/repositories/user_repository.dart';
import 'package:policiacomunitaria/src/models/models.user.dart';

class AuthReposiry {
  Future<UserCredential?> firebaseLoginEmail(String user, String pass) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: '${user.trim().toString()}@rapifas.com', password: pass);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        showToast('Este usuario no ha sido registrado');
      }
      if (e.code == 'wrong-password') {
        log('Contraseña Incorrecta, vuelva a intentarlo');
        showToast('Contraseña Incorrecta, vuelva a intentarlo');
      }
      showToast(e.code);
      return null;
    }
  }

  Future<UserModel?> getUserFromDB(String idUser) async =>
      await UserRepository().getUserDataFromDB(idUser);

  Future<UserModel?> loginUser(String email, String password) async {
    final UserCredential? respLoginFb =
        await firebaseLoginEmail(email, password);
    if (respLoginFb != null) {
      final UserModel? respGetDataUser =
          await getUserFromDB(respLoginFb.user!.uid);
      if (respGetDataUser != null) {
        return respGetDataUser;
      } else {
        await logOut();
        return null;
      }
    }
    return null;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserCredential?> registerEmailAndPass(
    String email,
    String pass,
  ) async =>
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: '${email.split('@')[0]}@policiacomunitaria.com',
        password: pass,
      );

  Future<UserModel?> saveUserDb(
    String idUser,
    String dni,
    String nombres,
    String email,
    String user,
  ) async {
    try {
      UserModel userSet = UserModel(
        direccion: '',
        dni: dni,
        email: email,
        idUser: idUser,
        name: nombres,
        userApp: user,
      );
      return await db
          .collection('usuarios')
          .doc(idUser)
          .set(userSet.toMap())
          .then(
            (value) => userSet,
          )
          .timeout(
            const Duration(seconds: 8),
            onTimeout: () => UserModel(),
          );
    } on FirebaseException catch (e) {
      showToast('No fue posible registrar este usuario, intente mas tarde: $e');
      await logOut();
      return null;
    } catch (e) {
      showToast('No fue posible registrar este usuario, intente mas tarde: $e');
      await logOut();
      return null;
    }
  }

  Future<UserModel?> registerUserEmail({
    required String dni,
    required String nombres,
    required String email,
    required String pass,
  }) async {
    try {
      final UserCredential? userCred = await registerEmailAndPass(email, pass);
      if (userCred != null) {
        return await saveUserDb(
          userCred.user!.uid,
          dni,
          nombres,
          email,
          '${email.split('@')[0]}@policiacomunitaria.com',
        );
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('su contraseña es demaciado corta');
      } else if (e.code == 'email-already-in-use') {
        showToast('Ud ya tiene una cuenta registrada!!');
      }
      return null;
    } catch (e) {
      log('error registro usuario:  $e');
      showToast('error al registrar usuario, intente nuevamente');
      return null;
    }
  }
}
