import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:culturas_new/app/data/db/dao/ponto_verificacaoDAO.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/data/models/ponto_verificacao.dart';
import 'package:culturas_new/app/data/models/talhao.dart';
import 'package:culturas_new/app/modules/monitoramento/form_verificacao.dart';
import 'package:culturas_new/app/modules/monitoramento/widgets/verificacao_modal.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:line_icons/line_icon.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as MapToolkit;
import 'package:moor_flutter/moor_flutter.dart';

import 'package:location/location.dart'; //serve para pegar o local do aparelho

class MonitoramentoController extends GetxController {
  MyDataBase db = MyDataBase.instance;

  List<Talhao>? listaTalhoes = [];

  // Posicao do usuario
  LatLng posicao = LatLng(0, 0);

  // Dados para salvar
  File? fotoVerificacao;
  Uint8List? fotoBase64;
  String? txtObservacao;

  // Ciclo de Tempo para Atualzição do Mapa
  Timer? temporizador;

//local

  Future<LatLng> locals() async {
    Location local = new Location();

    final localData = await local.getLocation();
    return LatLng(localData.latitude!, localData.longitude!);
  }

  Future<List<Talhao>> carregarListaTalhoes() async {
    posicao = await locals();
    // TODO carregar lista de Talhoes e Lista de Pontos baseados no DAO

    if (listaTalhoes!.isEmpty) {
      var listaTalhoesDAO = await TalhaoDAO(db).listAll().first;

      if (listaTalhoesDAO.isEmpty) {
        listaTalhoes = [
          Talhao(id: 0, nome: "Talhao 1", geometria: [
            [posicao.latitude - 00.0024166, posicao.longitude - 00.0040136],
            [posicao.latitude + 00.0012886, posicao.longitude - 00.00438037],
            [
              posicao.latitude + 00.0004883,
              posicao.longitude + 00.0009599
            ], //movimenta o lado inferior
            [
              posicao.latitude - 00.0026022,
              posicao.longitude + 00.0004005
            ], //movimenta o lado esquerdo sendo latitude a altura e longitude a posicao
            [
              posicao.latitude - 00.0026179,
              posicao.longitude - 00.0038127
            ], //tracker
          ], pontosVerificacao: [
            PontoVerificacao(
                id: 0,
                latitude: posicao.latitude,
                longitude: posicao.longitude,
                isPendente: true),
            PontoVerificacao(
                id: 1,
                latitude: posicao.latitude,
                longitude: posicao.longitude,
                isPendente: true),
            PontoVerificacao(
                id: 2,
                latitude: posicao.latitude,
                longitude: posicao.longitude,
                isPendente: true),
            PontoVerificacao(
                id: 3,
                latitude: posicao.latitude,
                longitude: posicao.longitude,
                isPendente: true),
            PontoVerificacao(
                id: 4,
                latitude: posicao.latitude,
                longitude: posicao.longitude,
                isPendente: true),
          ]),
          Talhao(id: 1, nome: "Talhao 2", geometria: [
            [-12.214125, -45.970077],
            [-12.214125, -45.970077],
            [-12.214125, -45.970077],
            [-12.214125, -45.970077],
            [-12.214125, -45.970077],
          ], pontosVerificacao: [
            PontoVerificacao(
                id: 3,
                latitude: -18.741508,
                longitude: -46.663459,
                isPendente: true),
            PontoVerificacao(
                id: 4,
                latitude: -18.742210,
                longitude: -46.662928,
                isPendente: false),
            PontoVerificacao(
                id: 5,
                latitude: -18.742935,
                longitude: -46.663038,
                isPendente: false),
          ])
        ];
        // for (Talhao talhao in listaTalhoes!) {
        //   List<int> listaIdsPontoVerificacao =
        //       talhao.pontosVerificacao!.map((e) {
        //     TalhaoDAO(db).addPontoVerificacao(TablePontoVerificacaoData(
        //         id: e.id!,
        //         idTalhao: talhao.id!,
        //         latitude: e.latitude!,
        //         longitude: e.longitude!,
        //         isPendente: e.isPendente!,
        //         createAt: DateTime.now(),
        //         updateAt: DateTime.now()));
        //     print(e.isPendente);
        //     return e.id!;
        //   }).toList();
        //   TalhaoDAO(db).addTalhao(TableTalhaoData(
        //       id: talhao.id!,
        //       nome: talhao.nome!,
        //       geometria: json.encode(talhao.geometria!),
        //       pontosVerificacao: json.encode(listaIdsPontoVerificacao),
        //       createAt: DateTime.now(),
        //       updateAt: DateTime.now()));
        // }
      } else {
        for (TableTalhaoData tableTalhaoData in listaTalhoesDAO) {
          List<PontoVerificacao> listaPontoVerificacao = [];
          List<TablePontoVerificacaoData> listaPontoVerificacaoTableData =
              await TalhaoDAO(db)
                  .getPontosVerificacaoTalhao(tableTalhaoData.id);
          for (TablePontoVerificacaoData tablePontoVerificacaoData
              in listaPontoVerificacaoTableData) {
            listaPontoVerificacao.add(PontoVerificacao(
                id: tablePontoVerificacaoData.id,
                idTalhao: tablePontoVerificacaoData.idTalhao,
                latitude: tablePontoVerificacaoData.latitude,
                longitude: tablePontoVerificacaoData.longitude,
                dataVerificacao: tablePontoVerificacaoData.dataVerificacao,
                foto: tablePontoVerificacaoData.foto,
                observacao: tablePontoVerificacaoData.observacao,
                isPendente: tablePontoVerificacaoData.isPendente));
          }
          List<List<double>> geometria = [];
          json.decode(tableTalhaoData.geometria).forEach((e) {
            List<double> posicaoList = [];
            e.forEach((f) => posicaoList.add(f));
            geometria.add(posicaoList);
          });
          listaTalhoes!.add(Talhao(
              id: tableTalhaoData.id,
              nome: tableTalhaoData.nome,
              geometria: geometria,
              pontosVerificacao: listaPontoVerificacao));
        }
      }
    }
    return listaTalhoes!;
  }

  Future<LatLng> getUserLocation() async {
    LocationData userPosition = await Location().getLocation();
    return LatLng(userPosition.latitude!, userPosition.longitude!);
  }

  void inicializarMapBoxVerificacao(
    MapboxMapController mapController,
    Talhao talhao,
    BuildContext context,
  ) async {
    sleep((Duration(seconds: 1)));
    List<LatLng> pontosVerificacaoTalhao = [];
    await mapController.addLine(LineOptions(
        lineColor: "#ffffff",
        lineWidth: 6,
        geometry: formatarLatLng(talhao.geometria!)));

    desenharElementosNoMapa(mapController, talhao, context);

    mapController.onSymbolTapped.add((Symbol symbol) async {
      if (symbol.options.geometry!.latitude <= posicao.latitude + 00.0012886 ||
          symbol.options.geometry!.latitude <= posicao.latitude - 00.0024166) {
        await showModalBottomSheet(
            isDismissible: false,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => VerificacaoModal(
                pontoVerificacao: symbol.data!['pontoVerificacao'],
                idTalhao: talhao.id!));
        mapController.updateSymbol(
            symbol,
            SymbolOptions(
                iconImage: symbol.data!['pontoVerificacao'].isPendente! == true
                    ? "assets/marker.png"
                    : "assets/marker02.png"));
        desenharElementosNoMapa(mapController, talhao, context);
      } else {}
    });
  }

  void inicializarMapBoxVerificacaoForm(MapboxMapController mapController,
      LatLng posicaoPonto, PontoVerificacao pontoVerificacao) async {
    sleep((Duration(seconds: 1)));
    mapController.addSymbol(
      SymbolOptions(
          geometry: posicaoPonto,
          iconSize: 1,
          iconHaloColor: "#ffffff",
          iconImage: pontoVerificacao.isPendente!
              ? "assets/marker.png"
              : "assets/marker02.png"),
    );
  }

  void addPoint(MapboxMapController mapController, LatLng posicaoPonto,
      Talhao talhao) async {
    sleep((Duration(seconds: 1)));
    List<LatLng> pontosVerificacaoTalhao = [];
    for (PontoVerificacao pontoVerificacao in talhao.pontosVerificacao!) {
      if (pontoVerificacao.isPendente!) {
        pontosVerificacaoTalhao.add(
            LatLng(pontoVerificacao.latitude!, pontoVerificacao.longitude!));

        mapController.addSymbol(
            SymbolOptions(
                geometry: posicaoPonto,
                iconSize: 1,
                iconImage: "assets/marker.png"),
            {
              "pontoVerificacao": pontoVerificacao,
              "idPontoVerificacao": pontoVerificacao.id
            });
      } else {
        mapController.addSymbol(
          SymbolOptions(
              geometry: posicao, iconSize: 1, iconImage: "assets/marker02.png"),
          {
            "pontoVerificacao": pontoVerificacao,
            "idPontoVerificacao": pontoVerificacao.id
          },
        );
      }
    }
  }

  List<LatLng> formatarLatLng(List<List<double>> posicoesDouble) {
    return List.from(posicoesDouble.map((e) => LatLng(e[0], e[1])));
  }

  Future<void> camera() async {
    var imagePicker = ImagePicker();
    try {
      XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image?.path != null || image?.path != '') {
        File file = File(image!.path);
        //criar a conversao aqui !
        fotoVerificacao = file;
        try {
          List<int> fileInByte = file.readAsBytesSync();
          fotoBase64 = base64Decode(base64Encode(fileInByte));
          update();
        } catch (e) {
          throw 'Erro ao converter Imagem na base64';
        }
      }
    } catch (e) {
      throw 'ERRO AO CARREGR CAMEERA $e';
    }
  }

  Future<void> salvar(PontoVerificacao pontoVerificacao, int idTalhao,
      PragaObject? pragaObject) async {
    // TODO Conectar e salvar ao DAO de Talhao e DAO de Ponto de Verificacao

    pontoVerificacao.foto = pontoVerificacao.foto != null
        ? pontoVerificacao.foto
        : base64.encode(fotoBase64!.toList());
    pontoVerificacao.praga = pragaObject!.praga;
    pontoVerificacao.amostragem = pragaObject.amostragem;
    pontoVerificacao.fase = pragaObject.fase;
    pontoVerificacao.intensidade = pragaObject.intensidade;
    pontoVerificacao.estrago = pragaObject.intensidade;
    pontoVerificacao.observacao = txtObservacao;
    pontoVerificacao.isPendente = false;

    await TalhaoDAO(db).updatePontoVerificacao(TablePontoVerificacaoData(
        id: pontoVerificacao.id!,
        idTalhao: pontoVerificacao.idTalhao == null
            ? idTalhao
            : pontoVerificacao.idTalhao!,
        latitude: pontoVerificacao.latitude!,
        longitude: pontoVerificacao.longitude!,
        dataVerificacao: DateTime.now(),
        observacao: txtObservacao,
        foto: base64.encode(fotoBase64!.toList()),
        isPendente: pontoVerificacao.isPendente!,
        createAt: DateTime.now(),
        updateAt: DateTime.now()));

    fotoBase64 = null;
  }

  Future<void> desenharElementosNoMapa(MapboxMapController mapController,
      Talhao talhao, BuildContext context) async {
    List<LatLng> pontosVerificacaoTalhao = [];
    posicao = await locals();
//false line down

    for (PontoVerificacao pontoVerificao in talhao.pontosVerificacao!) {
      if (pontoVerificao.isPendente!) {
        pontosVerificacaoTalhao
            .add(LatLng(pontoVerificao.latitude!, pontoVerificao.longitude!));
      }
    }

    List<LatLng> pontosDeVerificacaoPendentes = [
      posicao = await locals(),
      ...pontosVerificacaoTalhao
    ];

    Line? trajeto;

    for (Line linha in mapController.lines) {
      if (linha.data != null && linha.data!["tipo"] == "trajeto") {
        trajeto = linha;
      } else {
        trajeto = await mapController.addLine(
            LineOptions(
                lineColor: "#ff0000", geometry: pontosDeVerificacaoPendentes),
            {"tipo": "trajeto"});
      }
    }

    mapController.updateLine(
        trajeto!, LineOptions(geometry: pontosDeVerificacaoPendentes));
  }
}
