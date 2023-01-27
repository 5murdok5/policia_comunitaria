import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/logic/controllers/ctrl_app.dart';

class UserInfoController extends GetxController {
  var nameCtrl = TextEditingController();
  var rucCtrl = TextEditingController();
  var emailCtrl = TextEditingController();

  @override
  void onInit() {
    nameCtrl = TextEditingController();
    rucCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    setDatauser();
    super.onInit();
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    rucCtrl.dispose();
    emailCtrl.dispose();
    super.onClose();
  }

  setDatauser() {
    AppController appCtrl = Get.find();
    final user = appCtrl.userData!;
    nameCtrl.text = user.name ?? '';
    rucCtrl.text = user.dni ?? '';
    emailCtrl.text = user.email ?? '';
  }
}
