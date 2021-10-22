// To parse this JSON data, do
//
//     final atividadeModel = atividadeModelFromJson(jsonString);

import 'dart:convert';

import 'package:culturas_new/app/data/db/migrations/migrations.createAtividades.dart';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/data/models/parada.model.dart';
import 'package:culturas_new/app/data/models/posicao.dart';

import 'fazenda.model.dart';

class AtividadeModel {
  AtividadeModel({
    this.atividades,
    this.count,
  });

  List<Atividade>? atividades;
  int? count;

  factory AtividadeModel.fromRawJson(String str) =>
      AtividadeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AtividadeModel.fromJson(Map<String, dynamic> json) => AtividadeModel(
        atividades: json["atividades"] == null
            ? null
            : List<Atividade>.from(
                json["atividades"].map((x) => Atividade.fromJson(x))),
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "atividades": atividades == null
            ? null
            : List<dynamic>.from(atividades!.map((x) => x.toJson())),
        "count": count == null ? null : count,
      };
}

class Atividade {
  Atividade({
    this.id,
    this.atividade,
    this.data,
    this.fazenda,
    this.cultura,
    this.area,
    this.subArea,
    this.safra,
    this.areaEmHectares,
    this.perimetro,
    this.status,
    this.isSincronizadoAPI,
    this.maquinas,
    this.insumos,
    this.colaboradores,
  });

  String? id;
  String? atividade;
  DateTime? data;
  Fazenda? fazenda;
  String? cultura;
  String? area;
  String? subArea;
  String? safra;
  double? areaEmHectares;
  String? perimetro;
  int? status;
  bool? isSincronizadoAPI;
  List<MaquinaAtividade>? maquinas;
  List<InsumoAtividade>? insumos;
  List<ColaboradorAtividade>? colaboradores;
  List<Posicao>? dadosTelemetria;
  List<Parada>? paradas;

  // Terminar de fazer a adaptação

  factory Atividade.fromRawJson(String str) =>
      Atividade.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Atividade.fromJson(Map<String, dynamic> json) => Atividade(
        id: json["id"] == null ? null : json["id"],
        atividade: json["atividade"] == null ? null : json["atividade"],
        data: json["data"] == null ? null : DateTime.parse(json["data"]),
        fazenda: json["_Fazenda"] == null
            ? null
            : Fazenda.fromJson(json["_Fazenda"]),
        cultura: json["cultura"] == null ? null : json["cultura"],
        area: json["area"] == null ? null : json["area"],
        subArea: json["subArea"] == null ? null : json["subArea"],
        safra: json["safra"] == null ? null : json["safra"],
        areaEmHectares: json["areaEmHectares"] == null
            ? null
            : json["areaEmHectares"].toDouble(),
        perimetro: json["perimetro"] == null ? null : json["perimetro"],
        status: json["status"] == null ? null : json["status"],
        maquinas: json["maquinas"] == null
            ? null
            : List<MaquinaAtividade>.from(
                json["maquinas"].map((x) => MaquinaAtividade.fromJson(x))),
        insumos: json["insumos"] == null
            ? null
            : List<InsumoAtividade>.from(
                json["insumos"].map((x) => InsumoAtividade.fromJson(x))),
        colaboradores: json["colaboradores"] == null
            ? null
            : List<ColaboradorAtividade>.from(json["colaboradores"]
                .map((x) => ColaboradorAtividade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "atividade": atividade == null ? null : atividade,
        "data": data == null ? null : data?.toIso8601String(),
        "_Fazenda": fazenda == null ? null : fazenda!.toJson(),
        "cultura": cultura == null ? null : cultura,
        "area": area == null ? null : area,
        "subArea": subArea == null ? null : subArea,
        "safra": safra == null ? null : safra,
        "areaEmHectares": areaEmHectares == null ? null : areaEmHectares,
        "perimetro": perimetro == null ? null : perimetro,
        "status": status == null ? null : status,
        "maquinas": maquinas == null
            ? null
            : List<dynamic>.from(maquinas!.map((x) => x.toJson())),
        "insumos": insumos == null
            ? null
            : List<dynamic>.from(insumos!.map((x) => x.toJson())),
        "colaboradores": colaboradores == null
            ? null
            : List<dynamic>.from(colaboradores!.map((x) => x.toJson())),
        "dadosTelemetria": dadosTelemetria == null
            ? null
            : List<dynamic>.from(dadosTelemetria!.map((x) => x.toJson())),
        "paradas": paradas == null
            ? null
            : List<dynamic>.from(paradas!.map((x) => x.toJson())),
      };
}

class ColaboradorAtividade {
  ColaboradorAtividade({
    this.colaboradorId,
    this.nome,
  });

  String? colaboradorId;
  String? nome;

  factory ColaboradorAtividade.fromRawJson(String str) =>
      ColaboradorAtividade.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ColaboradorAtividade.fromJson(Map<String, dynamic> json) =>
      ColaboradorAtividade(
        colaboradorId:
            json["colaboradorId"] == null ? null : json["colaboradorId"],
        nome: json["nome"] == null ? null : json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "Id": colaboradorId == null ? null : colaboradorId,
        "ColaboradorId": colaboradorId == null ? null : colaboradorId,
        "nome": nome == null ? null : nome,
      };
}

class InsumoAtividade {
  InsumoAtividade({
    this.insumoId,
    this.descricao,
    this.quantidade,
    this.unidade,
  });

  String? insumoId;
  String? descricao;
  double? quantidade;
  String? unidade;

  factory InsumoAtividade.fromRawJson(String str) =>
      InsumoAtividade.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InsumoAtividade.fromJson(Map<String, dynamic> json) =>
      InsumoAtividade(
        insumoId: json["insumoId"] == null ? null : json["insumoId"],
        descricao: json["descricao"] == null ? null : json["descricao"],
        quantidade: json["quantidade"] == null ? null : json["quantidade"],
        unidade: json["unidade"] == null ? null : json["unidade"],
      );

  Map<String, dynamic> toJson() => {
        "InsumoId": insumoId == null
            ? null
            : "F3A3BDD2-A316-4A4A-81F7-108179BD7984", //insumoId,
        // "descricao": descricao == null ? null : descricao,
        //   "quantidade": quantidade == null ? null : quantidade,
        // "unidade": unidade == null ? null : unidade,
      };
}

class MaquinaAtividade {
  MaquinaAtividade({
    this.maquinaId,
    this.descricao,
  });

  String? maquinaId;
  String? descricao;

  factory MaquinaAtividade.fromRawJson(String str) =>
      MaquinaAtividade.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaquinaAtividade.fromJson(Map<String, dynamic> json) =>
      MaquinaAtividade(
        maquinaId: json["maquinaId"] == null ? null : json["maquinaId"],
        descricao: json["descricao"] == null ? null : json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "Id": maquinaId == null ? null : maquinaId,
        //"maquinaId": maquinaId == null ? null : maquinaId,
        //"descricao": descricao == null ? null : descricao,
      };

  TableMaquinaData toTableData() =>
      TableMaquinaData(id: maquinaId!, descricao: descricao ?? '');

  static List<TableMaquinaData> toListTableData(
          List<MaquinaAtividade> maquinas) =>
      maquinas.map((m) => m.toTableData()).toList();
}
