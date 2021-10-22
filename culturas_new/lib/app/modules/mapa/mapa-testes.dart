//import 'package:culturas_new/app/data/providers/api.dart';
import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/modules/atividade/atividade_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapaTest extends StatefulWidget {
  final AtividadeController controller;

  const MapaTest({Key? key, required this.controller}) : super(key: key);
  @override
  _MapaTestState createState() => _MapaTestState();
}

class _MapaTestState extends State<MapaTest> {
  @override
  void dispose() {
    widget.controller.temporizador!.cancel();
    widget.controller.rastreamentoIniciado = false;
    widget.controller.linhaHistorico = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller
        .getUserLocation()
        .then((userLocation) => widget.controller.pontoPos = userLocation);

    return GetBuilder<AtividadeController>(
        id: "mapaTestes",
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                title: Text("Mapa de Testes"),
                leading: IconButton(
                    onPressed: () {
                      controller.temporizador!.cancel();
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back))),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  //   target: controller.getUserLocation(),
                                  target: LatLng(
                                      controller
                                              .coordenadasMock.first.latitude +
                                          -0.00005,
                                      controller
                                              .coordenadasMock.first.longitude +
                                          0.00008),
                                  zoom: 18),
                              styleString:
                                  "mapbox://styles/mapbox/satellite-v9",
                              onMapCreated: (mapBoxController) =>
                                  controller.inicializarMapBoxTeste(
                                      mapBoxController,
                                      Atividade(id: "a"),
                                      context),
                              onUserLocationUpdated: (_) =>
                                  controller.observarInatividade(context),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ))),
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: controller.iniciarRastreamento,
                            child: controller.rastreamentoIniciadoOBS.isTrue
                                ? Text("Rastreamento Iniciado")
                                : Text("Iniciar rastreamento")),
                        ElevatedButton(
                            onPressed: () {
                              controller.carregarDados = true;
                            },
                            child: Text("Carregar dados"))
                      ],
                    )),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => Text("Lat: ${controller.testeLatitude}")),
                      Obx(() => Text("Long: ${controller.testeLongitude}")),
                      Obx(() => Text(
                          "dentro da area: ${controller.dentroDaArea.toString()}")),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
