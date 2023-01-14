import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:policiacomunitaria/src/models/models.upcs.dart';

final myLocation = LatLng(-4.012363, -79.197939);

class MapDtController extends GetxController {
  late PageController pagCtrl;
  late final MapController? ctrlMap;

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
    ctrlMap = MapController();
    debounce(
      _currentPage,
      (callback) => moveLocation(currentPage),
      time: const Duration(
        milliseconds: 300,
      ),
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

  moveLocation(index) {
    ctrlMap?.move(
      listUpcs[index].location!,
      17,
    );
  }

  goMyLocation() => ctrlMap?.move(
        myLocation,
        17,
      );
}
