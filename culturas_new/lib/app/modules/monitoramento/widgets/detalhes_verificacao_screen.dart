import 'dart:convert';

import 'package:culturas_new/app/data/models/ponto_verificacao.dart';
import 'package:culturas_new/app/modules/monitoramento/monitoramento_controller.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:get/get.dart';

class DetalhesVerificacaoScreen extends StatefulWidget {
  final PontoVerificacao pontoVerificacao;

  const DetalhesVerificacaoScreen({Key? key, required this.pontoVerificacao})
      : super(key: key);

  @override
  _DetalhesVerificacaoScreenState createState() =>
      _DetalhesVerificacaoScreenState();
}

class _DetalhesVerificacaoScreenState extends State<DetalhesVerificacaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: primaryColor, title: Text("Verificação")),
        body: GetBuilder<MonitoramentoController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(12),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                  ),
                  child: MapboxMap(
                    accessToken:
                        "sk.eyJ1IjoiYWdyb29uZTIwMjEiLCJhIjoiY2tzN3lneWd1MGZtdDMxcGV4a3l5cDVodCJ9.XUSPVNRv0bujRX-Gje_B-A",
                    initialCameraPosition: CameraPosition(
                        //   target: controller.getUserLocation(),
                        target: LatLng(widget.pontoVerificacao.latitude!,
                           widget.pontoVerificacao.longitude!),
                        zoom: 16),
                    styleString: "mapbox://styles/mapbox/satellite-v9",
                    onMapCreated: (mapBoxController) =>
                        controller.inicializarMapBoxVerificacaoForm(
                            mapBoxController,
                            LatLng(widget.pontoVerificacao.latitude!,
                                widget.pontoVerificacao.longitude!),
                            widget.pontoVerificacao),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text("Foto",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.all(12),
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primaryColor!, width: 1)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.memory(
                        base64.decode(widget.pontoVerificacao.foto!),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text("Observações",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold))),
                Container(
                    margin: EdgeInsets.all(12),
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: primaryColor!, width: 1)),
                    child: Text(widget.pontoVerificacao.observacao!)),
              ],
            ),
          );
        }));
  }
}
