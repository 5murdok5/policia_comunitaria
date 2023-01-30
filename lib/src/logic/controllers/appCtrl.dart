import 'dart:developer';

import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/actions/actions.toast.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/logic/repositories/custodia_repository.dart';
import 'package:policiacomunitaria/src/logic/repositories/user_repository.dart';
import 'package:policiacomunitaria/src/models/models.user.dart';
import 'package:policiacomunitaria/src/models/models_custodia.dart';
import 'package:policiacomunitaria/src/ui/pages/home/page.home.dart';

class AppController extends GetxController {
  UserRepository userRp = UserRepository();
  // User Data global

  final Rx<UserModel?> _userData = UserModel().obs;
  UserModel? get userData => _userData.value;
  set userData(UserModel? value) => _userData.value = value;

  final RxList<ModelCustodia> _listCustodias = <ModelCustodia>[].obs;
  List<ModelCustodia> get listCustodias => _listCustodias;
  set listCustodias(List<ModelCustodia> value) => _listCustodias.value = value;
  // Counter Data

  final _modeAlert = false.obs;
  get modeAlert => _modeAlert.value;
  set modeAlert(value) => _modeAlert.value = value;

  @override
  void onInit() async {
    await setUser();
    ever(_userData, (callback) async => await setStUser());
    super.onInit();
  }

  @override
  void onReady() async {
    await getCustodias();
    super.onReady();
  }

  // Methods
  setUser() async {
    userData?.idUser = 'init_user';
    final respUser = await userRp.checkUserDataStorage();
    userData = respUser;
    if (respUser?.idUser != null) {
      toPage(page: HomePage());
      showToast('Bienvenido!! ${respUser?.name?.toUpperCase()}',
          type: 'success');
    }
  }

  setStUser() async {
    if (userData!.idUser != null) {
      try {
        final userset = await userRp.setUserStorage(userData!);
        log(
          'User on Storage: ${userset.toString()} ',
        );
      } catch (e) {
        log('error save user $e');
      }
    }
  }

  changeStatusEmergency(bool status) async {
    modeAlert = status;
  }

  getCustodias() async {
    Future.delayed(const Duration(seconds: 2), () async {
      showToast('Buscando solicitudes de Custodia', type: 'load');
      final listSet =
          await CustodiaRepository().getCustodias(userData!.idUser!) ?? [];
      listCustodias = listSet;
      dismiseToast();
    });
  }
}
