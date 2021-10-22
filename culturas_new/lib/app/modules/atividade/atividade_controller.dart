import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:culturas_new/app/data/db/dao/atividade_dao.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/data/models/fazenda.model.dart';
import 'package:culturas_new/app/data/models/parada.model.dart';

import 'package:culturas_new/app/data/models/posicao.dart';
import 'package:culturas_new/app/modules/mapa/widgets/parada_modal.dart';
import 'package:culturas_new/core/utils/check_permitions.dart';
import 'package:culturas_new/core/values/constantes.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as MapToolkit;
import 'package:qrscan/qrscan.dart';

import '/app/data/models/atividade.model.dart';
import '/app/data/models/maquina.model.dart';
import '/app/modules/atividade/atividade_repository.dart';
import '/core/utils/alert.toast.dart';
import '/core/utils/connectivity.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class AtividadeController extends GetxController
    with StateMixin<AtividadeModel> {
  final AtividadeRepository repository;
  AtividadeController({required this.repository});

  MyDataBase db = MyDataBase.instance;
  Location location = Location();
  final serviceEnabled = false.obs;
  LocationData? locationData;
  late PermissionStatus _permissionStatus;
  //variaveis ref as configuraçoes do Map
  // Rx<Set<Marker>> markers = HashSet<Marker>().obs;
  // Rx<Set<Polygon>> polygons = HashSet<Polygon>().obs;

// Cara, como eu não gosto dessa lib de getx...
  RxList atividadesRx = [].obs;

  RxList<LatLng> polygonLatLngs = <LatLng>[].obs;
  double radius = 5.0;
  //Ids
  int polygonIdCount = 1;
  int circleIdCount = 1;
  int markerIdCount = 1;

  //type Controller of map
  final isPolygon = false.obs; //default
  bool isCirclen = false;
  final isMarker = false.obs;

//VARIAVEIS
  final nomeMaquina = ''.obs;

//controller TextEdit Finalizar
  TextEditingController txtQuantidadeInsumoController = TextEditingController();
  TextEditingController txtHectareController = TextEditingController();

  // Dados para rastreamento
  LatLng? pontoPos;
  bool rastreamentoIniciado = false;
  RxBool rastreamentoIniciadoOBS = false.obs;
  RxBool dentroDaArea = false.obs;
  List<LatLng> linhaHistorico = [];
  List<Parada> paradas = [];

  // Ciclo temporal
  Timer? temporizador;
  // Breakpoint para saber se o usuário ficou X tempos parado
  Timer? usuarioParado;

  // Mock
  List<LatLng> coordenadasMock = [
    LatLng(-12.213890, -45.958659),
    LatLng(-12.213933, -45.958388),
    LatLng(-12.214209, -45.958407),
    LatLng(-12.214174, -45.958687),
    LatLng(-12.213890, -45.958659),
  ];
  RxString testeLatitude = "".obs;
  RxString testeLongitude = "".obs;

//function Validation

  validarcamposatividades(Atividade atividade) {
    if (txtQuantidadeInsumoController.text.isEmpty ||
        txtHectareController.text.isEmpty) {
      alertToast('erro', 'Campo vazio!');
      return false;
    } else if (txtQuantidadeInsumoController.text !=
        atividade.insumos!.first.quantidade.toString()) {
      alertToast('erro', 'Quantidade de insumos incorreta!');
    } else if (txtHectareController.text !=
        atividade.areaEmHectares.toString()) {
      alertToast('erro', 'Área em hectares incorreta!');
    } else {
      return true;
    }
  }

  salvar(Atividade atividade) async {
    await AtividadeDAO(db).addAtividade(TableAtividadeData(
        id: atividade.id!,
        atividade: atividade.atividade!,
        data: atividade.data!,
        idFazenda: atividade.fazenda!.id!,
        cultura: atividade.cultura!,
        area: atividade.area!,
        subArea: atividade.subArea!,
        safra: atividade.safra!,
        areaEmHectares: atividade.areaEmHectares!,
        perimetro: atividade.perimetro!,
        status: atividade.status!,
        isSincronizadoAPI: atividade.isSincronizadoAPI!,
        idMaquinas:
            json.encode(atividade.maquinas!.map((e) => e.maquinaId).toList()),
        idInsumos:
            json.encode(atividade.insumos!.map((e) => e.insumoId).toList()),
        idColaboradores: json.encode(
            atividade.colaboradores!.map((e) => e.colaboradorId).toList())));
  }

//INICIAR A CHAMADA COM A API PARA BUSCAR AS ATIVIDADES
  iniciaAtividade() {
    print("Teste 1");
    repository.api.getRegistrosAtividades().then((value) {
      print("Teste 2");
      change(value, status: RxStatus.success());
      //metodos de sicronizacao aqui com o banco offline
    }, onError: (error) {
      change(null, status: RxStatus.error('Erro aos Sicronizar Atividades'));
    });
  }

//Recupera NomeMaquina por ID da API
  Future<String?> getNameMaquina({required String? idMaquina}) async {
    if (idMaquina == null) {
      alertToast('erro', "ID campo vazio");
      throw 'Erro iD vazio';
    } else {
      try {
        MaquinaModel response = await repository.api.getRegistrosMaquinas();

        for (var temp in response.maquinas!) {
          if (temp.id == idMaquina) {
            nomeMaquina.value = temp.nome.toString();
            return temp.nome!;
          }
        }
      } catch (e) {
        alertToast('erro', "Erro Tente novamente !");
        throw 'Erro Tente novamente !';
      }
    }
  }

//Ler QRCOD DEPOSITO
  Future lerQrCodeDeposito() async {
    String? qrcode = await scan(); //'09aa9046-da57-49b1-903f-03872ee05a14';
    //
    try {
      MaquinaModel response = await repository.api.getRegistrosMaquinas();

      for (var temp in response.maquinas!) {
        if (temp.id == qrcode!) {
          nomeMaquina.value = temp.nome.toString();
          alertToast('sucess', "Maquina Atualizada com sucesso!");
          return temp.nome!;
        }
      }
    } catch (e) {
      alertToast('erro', "Erro Tente novamente !");
      throw 'Erro Tente novamente !';
    }
  }

  //Convert String in Object
  convertStringinObject(String perimeter) {
    print(perimeter);
    var object = perimeter
        .replaceAll("{", "")
        .replaceAll("}", "")
        .replaceAll('"', "")
        .replaceAll("[", "")
        .replaceAll("]", "")
        .replaceAll(" ", "");

    var quebralinhas = object.split(',');
    var arrayPerimetro = [];
    for (int i = 0; i < quebralinhas.length; i++) {
      arrayPerimetro.add(double.parse(quebralinhas[i]));
    }

    if (arrayPerimetro.isNotEmpty) {
      for (int index = 0; index < (arrayPerimetro.length / 2); index++) {
        LatLng temp;
        if (index == 0) {
          temp =
              LatLng(arrayPerimetro[index], arrayPerimetro[index + 1]); //0-//1
        } else if (index == 1) {
          temp = LatLng(
              arrayPerimetro[index + 1], arrayPerimetro[index + 2]); //1-2 //3
        } else if (index == 2) {
          temp = LatLng(
              arrayPerimetro[index + 2], arrayPerimetro[index + 3]); //2-4 //5
        } else if (index == 3) {
          temp = LatLng(
              arrayPerimetro[index + 3], arrayPerimetro[index + 4]); //3-6 //
        } else {
          temp = LatLng(
              arrayPerimetro[index + 4], arrayPerimetro[index + 5]); //4-8 //9
        }
        polygonLatLngs.add(temp);
      }
    }

    // Transforma a lista em set para remover todas as duplicatas
    // e então a transforma em lista novamente.
    polygonLatLngs = polygonLatLngs.toSet().toList().obs;
    // Adiciona a primeira coordenada da linha do polígono
    // no fim dele, caso o polígono recebido da API não tenha
    // sido fechado.
    if (polygonLatLngs.first != polygonLatLngs.last) {
      polygonLatLngs.add(polygonLatLngs[0]);
    }
  }

//checa se tem permisao para pega localizacao atual
  void checkLocalizationPermission() async {
    serviceEnabled.value = await location.serviceEnabled();
    if (serviceEnabled.value) {
      serviceEnabled.value = await location.requestService();
      if (!serviceEnabled.value) {
        throw 'Sem permissão';
      }
    }
    _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus == PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    // location.enableBackgroundMode(enable: true);
    isMarker.value = true;
  }

  Future<bool> checkpermition() async {
    bool status = await location.serviceEnabled();

    return status;
  }

  @override
  void onInit() async {
    iniciaAtividade();
    bool permissao = await checkpermition();
    if (permissao == false) {
      checkLocalizationPermission();
    } else {
      //funcao static seta valor local
      setLocalization(await checkpermition());
    }
    checkLocalizationPermission();
    super.onInit();
  }

  @override
  void onReady() async {
    if (await VerifyInternet.verify()) {
      //TODOS CHECK INERNET TEM QUE SER UM METODO ASYNC
    } else {}
    super.onReady();
  }

  void inicializarMapBox(MapboxMapController mapController, Atividade atividade,
      int statusAtividade, BuildContext context) async {
    sleep((Duration(seconds: 1)));
    await mapController.addLine(LineOptions(
        lineColor: "#ffffff", lineWidth: 6, geometry: polygonLatLngs));

    if (statusAtividade == ATIVIDADE_EM_ANDAMENTO) {
      usuarioParado = Timer(Duration(seconds: 5), () async {
        await showModalBottomSheet(
            isDismissible: false,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => ParadaModal(controller: this));
      });

      Circle ponto = await mapController.addCircle(CircleOptions(
          draggable: false,
          circleColor: "#ff00ff",
          circleRadius: 5,
          geometry: pontoPos));

      linhaHistorico = [];

      Line linhaMapBox = await mapController.addLine(LineOptions(
          lineColor: "#ff0000", lineWidth: 6, geometry: linhaHistorico));

      temporizador = Timer.periodic(Duration(seconds: 5), (timer) async {
        if (mapController.isBlank == true) {
          timer.cancel();
          return;
        }

        var oldPontoPos = pontoPos;
        pontoPos = await getUserLocation();
        if (pontoPos != oldPontoPos) {
          observarInatividade(context);
        }
        await registrarPosicaoUsuario(pontoPos!, atividade);
        linhaHistorico.add(pontoPos!);
        //desenharLinha(mapController, linhaHistorico);
        usuarioEstaDentroArea(pontoPos!, coordenadasMock);

        await mapController.removeLine(linhaMapBox);
        linhaMapBox = await mapController.addLine(LineOptions(
            draggable: false,
            lineColor: "#ff0000",
            lineWidth: 6,
            geometry: linhaHistorico));

        await mapController.removeCircle(ponto);
        ponto = await mapController.addCircle(CircleOptions(
            draggable: false,
            circleColor: "#ff00ff",
            circleRadius: 5,
            geometry: pontoPos));
      });
    } else {
      desenharLinhaTelemetria(mapController, atividade, polygonLatLngs);
    }
  }

  // Por enquanto com testes
  List<LatLng> pontosMock = [];

  //desenharLinhaTelemetria(mapController, idAtividade, polygonLatLngs);

  registrarPosicaoUsuario(LatLng newPosition, Atividade atividade) {
    Posicao posicao = Posicao(
      latitude: newPosition.latitude,
      longitude: newPosition.longitude,
      timeStamp: DateTime.now(),
    );
    atividade.dadosTelemetria!.add(posicao);
  }

  Future<LatLng> getUserLocation() async {
    LocationData userPosition = await location.getLocation();
    return LatLng(userPosition.latitude!, userPosition.longitude!);
  }

  Future<void> desenharLinhaTelemetria(MapboxMapController mapController,
      Atividade atividade, List<LatLng> area) async {
    List<Posicao> historicoTelemetria = atividade.dadosTelemetria!;
    List<LatLng> linhasDesenhadas = [];

    for (int i = 0; i < historicoTelemetria.length; i++) {
      LatLng posicao = LatLng(
          historicoTelemetria[i].latitude!, historicoTelemetria[i].longitude!);
      if (i == 0) {
        linhasDesenhadas.add(posicao);
      } else {
        LatLng posicaoAnterior = LatLng(historicoTelemetria[i - 1].latitude!,
            historicoTelemetria[i - 1].longitude!);

        if (usuarioEstaDentroArea(posicao, area) == true &&
            usuarioEstaDentroArea(posicaoAnterior, area) == true) {
          await mapController.addLine(LineOptions(
              lineColor: "#0000ff",
              lineWidth: 1,
              geometry: [posicao, posicaoAnterior]));
        } else {
          await mapController.addLine(
              LineOptions(lineColor: "#ff0000", lineWidth: 1, geometry: [
            posicao,
            posicaoAnterior,
          ]));
        }
        linhasDesenhadas.add(posicao);
      }
    }
  }

  Map<String, String> obterRegistroTempoAtividade(Atividade atividade) {
    Map<String, String> registroTempo = {};
    List<Posicao> historicoTelemetria = atividade.dadosTelemetria!;

    Jiffy horaInicio = Jiffy(historicoTelemetria.first.timeStamp!);
    Jiffy horaConclusao = Jiffy(historicoTelemetria.last.timeStamp!);
    num duracao = horaInicio.diff(horaConclusao).abs();

    String segundos = ((duracao / 1000) % 60).floor().toString();
    String minutos = (duracao / (1000 * 60) % 60).floor().toString();
    String horas = (duracao / (1000 * 60 * 60) % 24).floor().toString();

    segundos = int.parse(segundos) < 10 ? "0" + segundos : segundos;
    minutos = int.parse(minutos) < 10 ? "0" + minutos : minutos;
    horas = int.parse(horas) < 10 ? "0" + horas : horas;

    registroTempo = {
      "horaInicio": Jiffy(horaInicio).format("dd/MM/yyyy HH:MM"),
      "horaConclusao": Jiffy(horaConclusao).format("dd/MM/yyyy HH:MM"),
      "duracao": horas + ":" + minutos + ":" + segundos,
    };

    return registroTempo;
  }

  // Variavel de teste. Ignore
  bool carregarDados = false;
  // Função de teste. Ignore
  void inicializarMapBoxTeste(MapboxMapController mapController,
      Atividade atividade, BuildContext context) async {
    sleep(Duration(seconds: 1));

    usuarioParado = Timer(Duration(seconds: 5), () {
      showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => ParadaModal(controller: this));
    });

    mapController.addLine(LineOptions(
        lineColor: "#ffffff", lineWidth: 3, geometry: coordenadasMock));

    testeLatitude = pontoPos!.latitude.toString().obs;
    testeLongitude = pontoPos!.longitude.toString().obs;

    Circle ponto = await mapController.addCircle(CircleOptions(
        draggable: false,
        circleColor: "#ff00ff",
        circleRadius: 5,
        geometry: pontoPos));

    Line linhaMapBox = await mapController.addLine(LineOptions(
        lineColor: "#ff0000", lineWidth: 1, geometry: linhaHistorico));

    temporizador = Timer.periodic(Duration(seconds: 5), (timer) async {
      if (mapController.isBlank == true) {
        timer.cancel();
        return;
      }

      if (carregarDados == true) {
        print("arroba");
        desenharLinhaTelemetria(mapController, atividade, coordenadasMock);
        carregarDados = false;
      }
      if (rastreamentoIniciado) {
        pontoPos = await getUserLocation();
        await registrarPosicaoUsuario(pontoPos!, atividade);
        linhaHistorico.add(pontoPos!);
        //desenharLinha(mapController, linhaHistorico);
        dentroDaArea = usuarioEstaDentroArea(pontoPos!, coordenadasMock)
            ? true.obs
            : false.obs;

        testeLatitude = pontoPos!.latitude.toString().obs;
        testeLongitude = pontoPos!.longitude.toString().obs;

        update(["mapaTestes"]);

        await mapController.removeLine(linhaMapBox);
        linhaMapBox = await mapController.addLine(LineOptions(
            lineColor: "#ff0000", lineWidth: 1, geometry: linhaHistorico));

        await mapController.removeCircle(ponto);
        ponto = await mapController.addCircle(CircleOptions(
            draggable: false,
            circleColor: "#ff00ff",
            circleRadius: 5,
            geometry: pontoPos));
      }
    });
  }

  bool usuarioEstaDentroArea(LatLng pos, List<LatLng> vertices) {
    MapToolkit.LatLng posicao = MapToolkit.LatLng(pos.latitude, pos.longitude);
    List<MapToolkit.LatLng> geometria = List.from(vertices)
        .map(
            (element) => MapToolkit.LatLng(element.latitude, element.longitude))
        .toList();
    return MapToolkit.PolygonUtil.containsLocation(posicao, geometria, true);
  }

  void iniciarRastreamento() {
    rastreamentoIniciado = true;
  }

  void observarInatividade(BuildContext context) async {
    print("uepa!");
    usuarioParado!.cancel();
    usuarioParado = Timer(Duration(seconds: 10), () async {
      await showModalBottomSheet(
          isDismissible: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => ParadaModal(controller: this));
    });
  }

  Future<void> enviarAtividadeAPI(Atividade atividade) async {
    await repository.api.postAtividade(atividade);
  }

  Future<void> sincronizar() async {
    List<Atividade> atividades = await repository.sincronizar();
    atividadesRx = atividades.obs;
  }

  Future<List<Atividade>>? getAtividadesBancoDeDados() async {
    List<Atividade> atividades = await repository.listarAtividades();
    atividadesRx = atividades.obs;

    return atividades;
  }
}
