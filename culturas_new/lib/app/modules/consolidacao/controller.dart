import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/data/models/combustivel.model.dart';
import 'package:culturas_new/app/data/models/maquina.model.dart';
import 'package:culturas_new/app/data/providers/api.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/utils/alert.toast.dart';
import 'package:culturas_new/core/utils/connectivity.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/routes/pages.dart';
import 'package:location/location.dart';

import '/core/values/constantes.dart';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';

class ConsolidacaoController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? controllerTab;
  final MyApi repository;

  TextEditingController controllerOleo = TextEditingController();
  TextEditingController controllerOdometro = TextEditingController();

  //criar uma lista de TabView para mostrar no Menu
  final List<Tab> myTabs = const [
    Tab(
        icon: Icon(
      Icons.today,
      semanticLabel: "Hoje",
    )),
    Tab(
        icon: Icon(
      Icons.history,
      semanticLabel: "Semana",
    )),
  ];

  ConsolidacaoController({required this.repository});

  //retorna uma imagem apos a conversao de String para binario
  Widget getImage(String? imagenbase64) {
    var _imagebase64 = imagenbase64;
    const Base64Codec base64 = Base64Codec();
    if (_imagebase64 == null) {
      return Container();
    } else {
      try {
        var bytes = base64.decode(_imagebase64);
        return Card(
            child: Container(
                padding: const EdgeInsets.only(bottom: 10, top: 10),
                height: Get.width / 6,
                width: double.infinity,
                child: Image.memory(
                  bytes,
                  width: 200,
                )));
      } catch (e) {
        return Container();
      }
    }
  }

  //verifica o status da aplicacao
  getConfigStatus(int? statusId) {
    if (statusId == null) {
      statusId = 0;
    }
    var configuracoesStatus = {
      CONSOLIDACAO_PENDENTE: {
        'icone': Icons.timer,
        'cor': "#FF7D04",
        'descricao': "Pendente",
      },
      CONSOLIDACAO_ENVIADA: {
        'icone': Icons.check_circle,
        'cor': "#357EED",
        'descricao': "Finalizado",
      },
    };

    return configuracoesStatus[statusId];
  }

  getData({required String textOleo, required String textOdometro}) {
    controllerOleo.text = textOleo;
    controllerOdometro.text = textOdometro;
  }

//Salva no Banco de dados
  Future<bool> save({required TableAbastecimentoData currentData}) async {
    var db = MyDataBase.instance;

    var temp = TableAbastecimentoData(
        createAt: currentData.createAt,
        fotoOdomentro: currentData.fotoOdomentro,
        fotoOleo: currentData.fotoOleo,
        id: currentData.id,
        idFazenda: currentData.idFazenda,
        idMaquina: currentData.idMaquina,
        nomeFazenda: currentData.nomeFazenda,
        nomeMaquina: currentData.nomeMaquina,
        odometro: controllerOdometro.text,
        oleo: controllerOleo.text,
        status: CONSOLIDACAO_ENVIADA,
        updateAt: DateTime.now());
    try {
      await db.abastecimentoDAO.updateAbastecimento(temp);
      return true;
    } catch (e) {
      return false;
    }
  }

//mostrar um dialog na tela para salvamento dos Dados
  Future showMessage({required TableAbastecimentoData currentData}) {
    return Get.defaultDialog(
      backgroundColor: primaryColor,
      titleStyle: TITULO_HEADER_STYLE,
      title: 'Confirme para salva seus dados',
      content: Column(
        children: const [
          const Icon(
            Icons.check_circle_outline,
            size: 77,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Após a confirmação dos dados não poderão ser alterados',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
        ],
      ),
      actions: [
        MaterialButton(
            shape: const StadiumBorder(),
            color: secondaryColor,
            onPressed: () async {
              if (await VerifyInternet.verify()) {
                LocationData posicao = await Location().getLocation();
                MaquinaModel resposta = await repository.getRegistrosMaquinas();
                Maquina maquina = resposta.maquinas!.firstWhere(
                    (element) => element.id == currentData.idMaquina);
                print(maquina.combustiveis);
                Map<String, dynamic> data = {
                  "maquinaId": currentData.idMaquina,
                  "depositoId": currentData.idFazenda,
                  "data": DateTime.now().toIso8601String(),
                  "latitude": posicao.latitude,
                  "longitude": posicao.longitude,
                  "leituraMarcador": 501, //double.parse(currentData.odometro) ,
                  "fotoMarcadorDaMaquina":
                      currentData.fotoOdomentro, //currentData.fotoOdomentro,
                  "fotoBombaAbastecimento":
                      currentData.fotoOleo, //currentData.fotoOleo
                  "combustiveis": [
                    {
                      "combustivelId": maquina.combustiveis![0],
                      "quantidade": 50
                    }
                  ]
                };
                await repository.postAbastecimento(json.encode(data));
                save(currentData: currentData).then((value) async => {
                      if (value)
                        {Get.offAllNamed(Routes.ATIVIDADES)}
                      else
                        {
                          alertToast(
                              'erro', 'Erro ao salvar no banco tente novamente')
                        }
                    });
              } else {
                alertToast('erro', 'sem conexão com a internet');
              }
            },
            child: const Text(
              'Confirmar informações',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }

//filtrar finalizados enviados para o servidor.
  List<TableAbastecimentoData>? getFinalizados(
      {required List<TableAbastecimentoData> data, required bool ispedendent}) {
    List<TableAbastecimentoData> newData = [];

    if (ispedendent) {
      for (var temp in data) {
        if (temp.status == CONSOLIDACAO_PENDENTE) {
          newData.add(temp);
        }
      }
      return newData;
    } else {
      for (var temp in data) {
        if (temp.status == CONSOLIDACAO_ENVIADA) {
          print(temp.status);
          newData.add(temp);
        }
      }
      return newData;
    }
  }

  @override
  void onInit() {
    super.onInit();
    controllerTab = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    controllerTab?.dispose();
    super.onClose();
  }
}
