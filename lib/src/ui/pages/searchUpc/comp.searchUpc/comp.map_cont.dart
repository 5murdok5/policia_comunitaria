import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:policiacomunitaria/src/logic/controllers/mapCtrl.dart';

class MapComp extends StatelessWidget {
  MapComp({super.key});

  final MapDtController mapCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      // mapController: mapCtrl.ctrlMap!,
      mapController: mapCtrl.ctrlMap,
      options: MapOptions(
        minZoom: 1,
        maxZoom: 20,
        zoom: 17,
        center: myLocation,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://mt0.google.com/vt/lyrs=m@221097413&x={x}&y={y}&z={z}',
        ),
        MarkerLayer(
          markers: [
            markerUser(
              Icons.location_history_sharp,
              myLocation,
            )
          ],
        ),
        MarkerLayer(
          markers: mapCtrl.listUpcs
              .map(
                (e) => markerUpcs(
                  Icons.policy,
                  e.location!,
                  isSelected: mapCtrl.currentPage == e.index,
                  index: e.index,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Marker markerUser(
    IconData icon,
    LatLng location,
  ) {
    return Marker(
      point: location,
      height: 45,
      width: 45,
      builder: (context) => CircleAvatar(
        backgroundColor: Colors.red[900],
        child: Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }

  Marker markerUpcs(
    IconData icon,
    LatLng location, {
    bool isSelected = false,
    int index = 0,
  }) {
    return Marker(
      point: location,
      height: isSelected ? 40 : 30,
      width: isSelected ? 40 : 30,
      builder: (context) => GestureDetector(
        onTap: () => mapCtrl.selectUpc(index),
        child: CircleAvatar(
          backgroundColor:
              isSelected ? Colors.orange : Color.fromARGB(255, 82, 96, 167),
          child: Icon(
            icon,
            color: Colors.white,
            size: isSelected ? 26 : 17,
          ),
        ),
      ),
    );
  }
}
