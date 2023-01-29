// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/global/global_valiables_app.dart';
import 'package:policiacomunitaria/src/logic/controllers/appCtrl.dart';
import 'package:policiacomunitaria/src/logic/repositories/auth_repository.dart';
import 'package:policiacomunitaria/src/models/models.user.dart';
import 'package:policiacomunitaria/src/ui/pages/home/page.home.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginForm = GlobalKey<FormState>();
  final AuthReposiry _auth = AuthReposiry();

  var userCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  // field register usuario
  var nameCtrl = TextEditingController();
  var rucCtrl = TextEditingController();
  var emailCtrl = TextEditingController();
  var repassCtrl = TextEditingController();

  final _showPass = true.obs;
  get showPass => _showPass.value;
  set showPass(value) => _showPass.value = value;

  final _loadLogin = false.obs;
  get loadLogin => _loadLogin.value;
  set loadLogin(value) => _loadLogin.value = value;

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    userCtrl = TextEditingController();
    passCtrl = TextEditingController();
    rucCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    repassCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    userCtrl.dispose();
    passCtrl.dispose();
    rucCtrl.dispose();
    emailCtrl.dispose();
    repassCtrl.dispose();
    super.onClose();
  }

// Methods
  viewPass() {
    showPass = !showPass;
  }

  loginUser() async {
    loadLogin = true;
    showToast('Ingresando...', type: 'load');
    if (loginForm.currentState!.validate()) {
      dismisKeybr();
      final UserModel? user =
          await _auth.loginUser(userCtrl.text.trim(), passCtrl.text);
      if (user != null) {
        // AppController appCtrl = Get.find();
        AppController appCtrl = Get.put(AppController());
        appCtrl.userData = user;
        showToast('Bienvenido ${user.name!.toUpperCase()}!!', type: 'success');
        toPage(
          page: HomePage(),
        );
      }
      loadLogin = false;
    } else {
      loadLogin = false;
      showToast(
        'Ingresa los datos faltantes',
      );
    }
  }

  registerUser() async {
    loadLogin = true;
    if (passCtrl.text != repassCtrl.text) {
      showToast('Las contraseñas no son iguales, intente nuevamente');
      loadLogin = false;
      return;
    }
    if (loginForm.currentState!.validate()) {
      showToast('Registrando Usuario, Espere...', type: 'load');
      dismisKeybr();
      final UserModel? user = await _auth.registerUserEmail(
        dni: rucCtrl.text,
        email: emailCtrl.text,
        nombres: nameCtrl.text,
        pass: passCtrl.text,
      );
      if (user != null) {
        final AppController appCtrl = Get.find();
        appCtrl.userData = user;
        showToast('Bienvenido!! ${user.name?.toUpperCase()}', type: 'success');
        toPage(
          page: HomePage(),
          removePreviusPages: true,
        );
      }
      loadLogin = false;
      return;
    } else {
      loadLogin = false;
      showToast(
        'Ingresa los datos faltantes',
      );
    }
  }
}
