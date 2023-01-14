import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:policiacomunitaria/src/models/models.upcs.dart';

class MapDtController extends GetxController {
  late PageController pagCtrl;
  final List<ModelsUpcs> listUpcs = listTestUpcs;

  final _currentPage = 0.obs;
  get currentPage => _currentPage.value;
  set currentPage(value) => _currentPage.value = value;

  @override
  void onInit() {
    pagCtrl = PageController(
      initialPage: 0,
      viewportFraction: 0.95,
    );
    super.onInit();
  }

  @override
  void onClose() {
    pagCtrl.dispose();
    super.onClose();
  }

  onchangePage(int index) {
    currentPage = index;
    update();
  }

  selectUpc(index) {
    currentPage = index;
    pagCtrl.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }
}
