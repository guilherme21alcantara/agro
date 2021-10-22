import 'dart:convert';
import 'dart:developer';

import 'package:culturas_new/app/data/models/abastecimento.model.dart';
import 'package:culturas_new/app/data/models/combustivel.model.dart';
import 'package:culturas_new/app/data/models/maquina.model.dart';
import 'package:flutter/material.dart';

import '/app/data/models/atividade.model.dart';
import '/app/data/models/colaborador.model.dart';
import '/app/data/models/deposito.model.dart';
import '/app/data/models/fazenda.model.dart';
import '/app/data/models/insumo.model.dart';
import '/core/utils/alert.toast.dart';
import '/core/utils/token.service.dart';
import '/core/values/constantes.dart';
import '/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyApi extends GetConnect {
  //Login
  login(
      {required RxBool sendDate, required String login, required senha}) async {
    sendDate.value = true;
    var dados = {
      'email': login,
      'senha': senha,
    };

    try {
      Response response = await post("$BASE_API/Auth/", dados);
      print(dados);
      print(response.body);
      print(response.statusCode);
      sendDate.value = false;
      if (response.statusCode == 200) {
        var prefs = GetStorage();
        prefs.write('jwt', response.body);
        Get.offAllNamed(Routes
            .ATIVIDADES); // precisa de ajustes na API  para remover isso daqui
      } else if (response.body == null) {
        alertToast('erro', 'Ocorreu um problema ao conetar com o servidor');
      } else {
        alertToast('erro', response.body['message']);
      }
    } catch (error) {
      sendDate.value = false;
      alertToast('erro', 'Ocorreu um problema ao conetar com o servidor');
    }
  }

  //Retorna as Atividades
  Future<AtividadeModel> getRegistrosAtividades() async {
    try {
      var response = await get('$BASE_API/Atividades/', headers: getHeaders());
      if (response.statusCode != 200) {
        alertToast('erro',
            'Erro ao sincronizar atividades' + response.statusText.toString());
        throw Exception();
      } else if (response.hasError) {
        alertToast('erro', response.statusText);
      }
      AtividadeModel registros = AtividadeModel.fromJson(response.body);
      return registros;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar atividades');
      throw Exception();
    }
  }

  //Retorna as Fazendas
  Future<FazendaModel> getRegistrosFazendas() async {
    try {
      var response = await get('$BASE_API/Fazendas/', headers: getHeaders());

      if (response.statusCode != 200) {
        alertToast('erro',
            'Erro ao sincronizar Fazendas' + response.statusText.toString());
        throw Exception();
      }

      FazendaModel fazendas = FazendaModel.fromJson(response.body);

      return fazendas;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar fazendas');
      throw Exception();
    }
  }

//Retorna Insumos
  Future<InsumoModel> getRegistros() async {
    try {
      var response = await get('$BASE_API/Insumos/', headers: getHeaders());

      if (response.statusCode != 200) {
        alertToast('erro',
            'Erro ao sincronizar Insumo' + response.statusText.toString());
        throw Exception();
      }
      InsumoModel registros = InsumoModel.fromJson(response.body);

      return registros;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar insumos');
      throw Exception();
    }
  }

//Retorna Depositos
  Future<DepositoModel> getRegistrosDeposito() async {
    try {
      var response = await get('$BASE_API/depositos/', headers: getHeaders());

      if (response.statusCode != 200) {
        alertToast('erro',
            'Erro ao sincronizar Deposito' + response.statusText.toString());
        throw Exception();
      }

      DepositoModel depositos = DepositoModel.fromJson(response.body);

      return depositos;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar depósitos');
      throw Exception();
    }
  }

//retorna Abastecimentos
  Future<AbastecimentoModel> getAbastecimento() async {
    try {
      var response =
          await get('$BASE_API/Abastecimento/', headers: getHeaders());

      if (response.statusCode != 200) {
        alertToast('erro',
            'Erro ao sincronizar Colaborador' + response.statusText.toString());
        throw Exception();
      }

      AbastecimentoModel colaboradores =
          AbastecimentoModel.fromJson(response.body);
      //ColaboradorModel.fromJson(response.body);

      return colaboradores;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar colaboradores');
      throw Exception();
    }
  }

//retorna Colaboradores
  Future<ColaboradorModel> getRegistrosColaboradores() async {
    try {
      var response =
          await get('$BASE_API/colaboradores/', headers: getHeaders());

      if (response.statusCode != 200) {
        alertToast('erro',
            'Erro ao sincronizar Colaborador' + response.statusText.toString());
        throw Exception();
      }

      ColaboradorModel colaboradores = ColaboradorModel.fromJson(response.body);

      return colaboradores;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar colaboradores');
      throw Exception();
    }
  }

//retorna combustivel
  Future<CombustivelModel> getRegistrosCombustiveis() async {
    try {
      var response =
          await get('$BASE_API/Combustiveis/', headers: getHeaders());

      if (response.statusCode != 200) {
        alertToast(
            'erro',
            'Erro ao sincronizar Combustiveis' +
                response.statusText.toString());
        throw Exception();
      }

      CombustivelModel registros = CombustivelModel.fromJson(response.body);

      return registros;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar combustíveis');
      throw Exception();
    }
  }

//retorno Maquinas
  Future<MaquinaModel> getRegistrosMaquinas() async {
    try {
      var response = await get('$BASE_API/Maquinas/', headers: getHeaders());

      if (response.statusCode != 200) {
        alertToast('erro',
            'Erro ao sincronizar Maquina' + response.statusText.toString());
        throw Exception();
      }

      MaquinaModel registros = MaquinaModel.fromJson(response.body);

      return registros;
    } catch (ex) {
      alertToast('erro', 'Erro ao sincronizar maquinas');
      throw Exception();
    }
  }

//----------daqui para baixo apenas os metodos Posts------------//

  Future<void> Pluviometria(String talhao, String codigo) async {}

  Future<void> postAbastecimento(String abastecimento) async {
    try {
      var box = GetStorage();
      var jwt = await box.read("jwt");
      var headers = {
        'Content-Type': 'text/json',
        'Authorization': 'Bearer $jwt',
      };

      log(abastecimento);
      print('Bearer $jwt');

      var response = await post('$BASE_API/Abastecimento/', abastecimento,
          headers: headers);

      print(response.statusCode);

      if (response.statusCode != 200) {
        throw Exception();
      }
    } catch (ex) {
      throw Exception();
    }
  }

  Future<void> postAtividade(Atividade atividade) async {
    log(json.encode(atividade.toJson()));
    try {
      var box = GetStorage();
      var jwt = await box.read("jwt");
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $jwt',
      };

      print('Bearer $jwt');

      var response = await post('$BASE_API/Atividades/', atividade.toJson(),
          headers: headers);

      print(response.statusCode);

      if (response.statusCode != 200) {
        throw Exception();
      }
    } catch (ex) {
      throw Exception();
    }
  }
}
