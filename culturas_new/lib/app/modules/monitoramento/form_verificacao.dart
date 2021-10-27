import 'dart:convert';

import 'package:culturas_new/app/data/models/ponto_verificacao.dart';
import 'package:culturas_new/app/modules/monitoramento/monitoramento_controller.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:get/get.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

class FormVerificacaoScreen extends StatefulWidget {
  final PontoVerificacao pontoVerificacao;
  final int idTalhao;

  const FormVerificacaoScreen(
      {Key? key, required this.pontoVerificacao, required this.idTalhao})
      : super(key: key);

  @override
  _FormVerificacaoScreenState createState() => _FormVerificacaoScreenState();
}

class _FormVerificacaoScreenState extends State<FormVerificacaoScreen> {
  bool _fotoTirada = false;
  var praga = <String>[
    'Roscas',
    'Nóctuas',
    'Melolonta',
    'Ralos',
    'Alfinetes',
    'Brocas'
  ];
  var amostragem = <String>['Visual(VIS)', 'Armadilhas(ARM)', 'Pancadas(PAN)'];
  var fase = <String>['Ovos/Postura(PT)', 'Adultos(Ad)', 'Ninfas/Larvas(N)'];
  var intensidade = <String>[
    '0 (Ausência)',
    '1 (até 5%)',
    '2 (5% - 10%)',
    '3 (10% - 20%)',
    '4 (20% - 35%)',
    '5 (35% - 50%)',
    '6 (50% - 75%)',
    '7 (75% - 100%)'
  ];
  TextEditingController txtObservacaoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.pontoVerificacao.observacao != null) {
      txtObservacaoController.text = widget.pontoVerificacao.observacao!;
    }
    if (widget.pontoVerificacao.foto != null) {
      _fotoTirada = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PragaObject? pragaObject = new PragaObject();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text("Adicionar Verificação")),
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
                    minMaxZoomPreference: MinMaxZoomPreference.unbounded,
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
                _fotoTirada
                    ? Container(
                        margin: EdgeInsets.all(12),
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: primaryColor!, width: 1)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                              onTap: () {
                                setState(() async {
                                  await controller.camera();
                                  if (controller.fotoVerificacao != null) {
                                    _fotoTirada = true;
                                    widget.pontoVerificacao.foto = null;
                                  }
                                });
                              },
                              child: Image.memory(
                                  widget.pontoVerificacao.foto != null
                                      ? base64
                                          .decode(widget.pontoVerificacao.foto!)
                                      : controller.fotoBase64!,
                                  fit: BoxFit.cover)),
                        ))
                    : Container(
                        margin: EdgeInsets.all(12),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: primaryColor!, width: 1)),
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt),
                              Text("Tirar Foto")
                            ],
                          ),
                          onTap: () {
                            setState(() async {
                              await controller.camera();
                              if (controller.fotoVerificacao != null) {
                                _fotoTirada = true;
                              }
                            });
                          },
                        ),
                      ),
                Container(
                  height: 60,
                  width: 360,
                  child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      items: praga,
                      onChanged: (value) {
                        print(value);
                        pragaObject.praga = value;
                      },
                      selectedItem: widget.pontoVerificacao.praga),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 360,
                  child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      items: amostragem,
                      onChanged: (value) {
                        print(value);
                        pragaObject.amostragem = value;
                      },
                      selectedItem: widget.pontoVerificacao.amostragem),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 360,
                  child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      items: fase,
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: (value) {
                        print(value);
                        pragaObject.fase = value;
                      },
                      selectedItem: widget.pontoVerificacao.fase),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 60,
                      width: 170,
                      child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: intensidade,
                          onChanged: (value) {
                            print(value);
                            pragaObject.intensidade = value;
                          },
                          selectedItem: widget.pontoVerificacao.intensidade),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 170,
                      child: DropdownSearch<String>(
                          mode: Mode.MENU,
                          items: intensidade,
                          onChanged: (value) {
                            print(value);
                            pragaObject.intensidade = value;
                          },
                          selectedItem: widget.pontoVerificacao.estrago),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text("Observações",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: primaryColor!, width: 1)),
                  child: TextField(
                    controller: txtObservacaoController,
                    minLines: 4,
                    maxLines: 4,
                    onChanged: (value) {
                      controller.txtObservacao = value;
                    },
                  ),
                ),
                InkWell(
                  child: Container(
                    color: primaryColor,
                    width: double.infinity,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: Colors.white, size: 36),
                        Text("Salvar", style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  onTap: () {
                    if (_fotoTirada) {
                      controller.salvar(widget.pontoVerificacao,
                          widget.idTalhao, pragaObject);
                      Get.back();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Tire a foto!")));
                    }
                  },
                )
              ],
            ),
          );
        }));
  }
}

class PragaObject {
  String? praga;
  String? amostragem;
  String? fase;
  String? intensidade;

  PragaObject() {
    this.praga = '';
    this.amostragem = '';
    this.fase = '';
    this.intensidade = '';
  }
}
