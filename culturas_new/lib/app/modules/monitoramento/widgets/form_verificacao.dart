import 'dart:convert';

import 'package:culturas_new/app/data/models/ponto_verificacao.dart';
import 'package:culturas_new/app/modules/monitoramento/form_verificacao.dart';
import 'package:culturas_new/app/modules/monitoramento/monitoramento_controller.dart';
import 'package:culturas_new/core/values/colors.dart';
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
  DropdownEditingController<String>? pragaController =
      DropdownEditingController();
  DropdownEditingController<String>? amostragemController =
      DropdownEditingController();
  DropdownEditingController<String>? faseController =
      DropdownEditingController();
  DropdownEditingController<String>? intensidadeController =
      DropdownEditingController();

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
                  child: TextDropdownFormField(
                    options: praga,
                    controller: pragaController,
                    onSaved: (text) {
                      text = pragaController!.value;
                      pragaObject.praga = text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor!)),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        labelText: "Praga"),
                    dropdownHeight: 80,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 360,
                  child: TextDropdownFormField(
                    options: amostragem,
                    controller: amostragemController,
                    onSaved: (text) {
                      text = pragaController!.value;
                      pragaObject.amostragem = text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor!)),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        labelText: "Amostragem"),
                    dropdownHeight: 80,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 360,
                  child: TextDropdownFormField(
                    options: fase,
                    controller: faseController,
                    onSaved: (text) {
                      text = pragaController!.value;
                      pragaObject.fase = text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor!)),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        labelText: "Fase"),
                    dropdownHeight: 80,
                  ),
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
                      child: TextDropdownFormField(
                        options: intensidade,
                        controller: intensidadeController,
                        onSaved: (text) {
                          text = pragaController!.value;
                          pragaObject.intensidade = text;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!)),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            labelText: "Intensidade "),
                        dropdownHeight: 80,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 60,
                      width: 170,
                      child: TextDropdownFormField(
                        options: intensidade,
                        controller: intensidadeController,
                        onSaved: (text) {
                          text = pragaController!.value;
                          pragaObject.intensidade = text;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor!)),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                            labelText: "Estrago"),
                        dropdownHeight: 80,
                      ),
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
