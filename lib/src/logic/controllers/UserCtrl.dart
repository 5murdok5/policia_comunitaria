import 'package:get/get.dart';
import 'package:policiacomunitaria/src/models/models.user.dart';

class UserController extends GetxController {
  final _userDt = UserModel().obs;
  UserModel get userDt => _userDt.value;
  set userDt(UserModel value) => _userDt.value = value;

  @override
  void onInit() {
    checkUserOnStorage();
    super.onInit();
  }

  checkUserOnStorage() {
    userDt = UserModel(
        dni: '1105147951',
        email: 'santiago.moreno52@gmail.com',
        idUser: 'userlocal',
        name: 'Santiago Moreno');
  }
}
