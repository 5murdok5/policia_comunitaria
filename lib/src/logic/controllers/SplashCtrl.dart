import 'package:get/get.dart';
import 'package:policiacomunitaria/src/global/global.page_navigator.dart';
import 'package:policiacomunitaria/src/logic/controllers/UserCtrl.dart';
import 'package:policiacomunitaria/src/ui/pages/home/page.home.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Get.put(UserController(), permanent: true);
    checkDataUser();
    super.onInit();
  }

  checkDataUser() {
    Future.delayed(const Duration(seconds: 2), () {
      toPage(page: const HomePage());
      Get.delete<SplashController>();
    });
  }
}
