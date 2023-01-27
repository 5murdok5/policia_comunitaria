import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global_sharedpreferences.dart';
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

  checkUserOnStorage() async {
    final userSt = await getUserSt();
    userDt = userSt ?? UserModel();
  }
}
