//import 'package:culturas_new/app/data/providers/api.dart';
import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/modules/atividade/atividade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Mapa extends GetView<AtividadeController> {
  final String perimetro;
  final Atividade atividade;
  final int statusAtividade;
  const Mapa(
      {required this.perimetro,
      required this.atividade,
      required this.statusAtividade});
  @override
  Widget build(BuildContext context) {
    controller
        .getUserLocation()
        .then((userLocation) => controller.pontoPos = userLocation);
    controller.convertStringinObject(perimetro);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              child: Obx(() => controller.isMarker.value
                  ? MapboxMap(
                      accessToken:
                          "sk.eyJ1IjoiYWdyb29uZTIwMjEiLCJhIjoiY2tzN3lneWd1MGZtdDMxcGV4a3l5cDVodCJ9.XUSPVNRv0bujRX-Gje_B-A",
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              controller.polygonLatLngs.first.latitude,
                              controller.polygonLatLngs.first.longitude),
                          zoom: 15),
                      styleString: "mapbox://styles/mapbox/satellite-v9",
                      onMapCreated: (mapController) =>
                          controller.inicializarMapBox(mapController, atividade,
                              statusAtividade, context),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ))),
        ),
      ],
    );
  }
}

// ? GoogleMap(
                  //     initialCameraPosition: CameraPosition(
                  //         target: LatLng(
                  //           controller.polygonLatLngs.first.latitude,
                  //           controller.polygonLatLngs.first.longitude,
                  //         ),
                  //         zoom: 16),
                  //     mapType: MapType.hybrid,
                  //     markers: controller.markers.value,
                  //     myLocationEnabled: false,
                  //     polygons: controller.polygons.value,
                  //   )