//@dart=2.9
//import 'package:culturas_new/app/data/providers/api.dart';
import 'dart:io';
import 'dart:math';

import 'package:culturas_new/app/data/models/ponto_verificacao.dart';
import 'package:culturas_new/app/data/models/talhao.dart';
import 'package:culturas_new/app/modules/monitoramento/monitoramento_controller.dart';
import 'package:culturas_new/app/modules/monitoramento/widgets/verificacao_modal.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapaMonitoramentoScreen extends StatefulWidget {
  final Talhao talhao;
  final LatLng cPostion;
  final Symbol symbol;
  final PontoVerificacao pontoVerificacao;
  const MapaMonitoramentoScreen(
      {Key key, this.talhao, this.cPostion, this.symbol, this.pontoVerificacao})
      : super(key: key);
  @override
  _MapaMonitoramentoScreenState createState() =>
      _MapaMonitoramentoScreenState();
}

class _MapaMonitoramentoScreenState extends State<MapaMonitoramentoScreen> {
  MapboxMapController mapController;
  double aprox;
  LatLng currentPostion;

  @override
  void dispose() {
    MonitoramentoController controller = Get.find<MonitoramentoController>();
    controller.temporizador.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  void _getUserLocation() async {
    LocationData userPosition = await Location().getLocation();
    currentPostion = LatLng(userPosition.latitude, userPosition.longitude);
  }

  int point = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    double contador = 16;

    return GetBuilder<MonitoramentoController>(
        init: MonitoramentoController(),
        builder: (controller) {
          controller
              .getUserLocation()
              .then((userLocation) => controller.posicao = userLocation);
          return Scaffold(
            appBar: AppBar(
                backgroundColor: primaryColor,
                centerTitle: true,
                title: Text("Rastreamento "),
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back))),
            body: Stack(
              children: [
                Center(
                    child: Column(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 90,
                        child: MapboxMap(
                          onMapClick: (Point double, LatLng a) {
                            if (a.latitude.toPrecision(4) ==
                                controller.posicao.latitude.toPrecision(4)) {
                              int teste = 10;
                              if (point == 0) {
                                controller.addPoint(mapController,
                                    currentPostion, widget.talhao);
                              }
                              if (point != 0 && point < teste) {
                                controller.addPoint(mapController,
                                    currentPostion, widget.talhao);

                                setState(() {
                                  point++;
                                });
                                sleep((Duration(seconds: 1)));

                                controller.desenharElementosNoMapa(mapController, widget.talhao, context);
                              }
                              setState(() {
                                point++;
                              });
                            } else {
                              print("o");
                            }
                          },
                          myLocationEnabled: true,
                          myLocationTrackingMode:
                              MyLocationTrackingMode.Tracking,
                          myLocationRenderMode: MyLocationRenderMode.COMPASS,
                          minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                          accessToken:
                              "sk.eyJ1IjoiYWdyb29uZTIwMjEiLCJhIjoiY2tzN3lneWd1MGZtdDMxcGV4a3l5cDVodCJ9.XUSPVNRv0bujRX-Gje_B-A",
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                controller.posicao.latitude,
                                controller.posicao
                                    .longitude), //aqui pega a posicao no mapa
                            zoom: contador,
                          ),
                          styleString: "mapbox://styles/mapbox/satellite-v9",
                          onMapCreated: (mapBoxController) => {
                            mapController = mapBoxController,
                            _getUserLocation(),
                            aprox = mapBoxController.cameraPosition.zoom,
                            controller.inicializarMapBoxVerificacao(
                                mapBoxController, widget.talhao, context)
                          },
                        ))
                  ],
                )),
                Positioned(
                    left: 330,
                    bottom: 250,
                    child: FloatingActionButton(
                        backgroundColor: primaryColor,
                        child: Icon(Icons.location_searching),
                        onPressed: () {
                          mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: currentPostion,
                                zoom: 22.0,
                              ),
                            ),
                          );
                        })),
                Positioned(
                    left: 340,
                    bottom: 100,
                    child: Container(
                        width: 40,
                        height: 70,
                        color: Colors.transparent,
                        child: FloatingActionButton(
                            backgroundColor: primaryColor,
                            child: Icon(Icons.add),
                            onPressed: () {
                              mapController
                                  .animateCamera(CameraUpdate.zoomIn());
                            }))),
                Positioned(
                    left: 341,
                    bottom: 50,
                    child: Container(
                        width: 40,
                        height: 70,
                        color: Colors.transparent,
                        child: FloatingActionButton(
                            backgroundColor: primaryColor,
                            child: Icon(Icons.remove),
                            onPressed: () {
                              mapController
                                  .animateCamera(CameraUpdate.zoomOut());
                            })))
              ],
            ),
          );
        });
  }
}
