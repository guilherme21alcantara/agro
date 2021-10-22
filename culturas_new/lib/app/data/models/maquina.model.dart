// To parse this JSON data, do
//
//     final maquinaModel = maquinaModelFromJson(jsonString);

import 'dart:convert';

import 'package:culturas_new/app/data/db/my_database.dart';

class MaquinaModel {
  MaquinaModel({
    this.maquinas,
  });

  List<Maquina>? maquinas;

  factory MaquinaModel.fromRawJson(String str) =>
      MaquinaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaquinaModel.fromJson(Map<String, dynamic> json) => MaquinaModel(
        maquinas: json["maquinas"] == null
            ? null
            : List<Maquina>.from(
                json["maquinas"].map((x) => Maquina.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "maquinas": maquinas == null
            ? null
            : List<dynamic>.from(maquinas!.map((x) => x.toJson())),
      };
}

class Maquina {
  Maquina({
    this.id,
    this.nome,
    this.capacidadeCombustivel,
    this.ultimaLeitura,
    this.tipoMarcador,
    this.combustivelPadraoId,
    this.combustiveis,
  });

  String? id;
  String? nome;
  int? capacidadeCombustivel;
  int? ultimaLeitura;
  int? tipoMarcador;
  String? combustivelPadraoId;
  List<String>? combustiveis;

  factory Maquina.fromRawJson(String str) => Maquina.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Maquina.fromJson(Map<String, dynamic> json) => Maquina(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        capacidadeCombustivel: json["capacidadeCombustivel"] == null
            ? null
            : json["capacidadeCombustivel"],
        ultimaLeitura:
            json["ultimaLeitura"] == null ? null : json["ultimaLeitura"],
        tipoMarcador:
            json["tipoMarcador"] == null ? null : json["tipoMarcador"],
        combustivelPadraoId: json["combustivelPadraoId"] == null
            ? null
            : json["combustivelPadraoId"],
        combustiveis: json["combustiveis"] == null
            ? null
            : List<String>.from(json["combustiveis"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "capacidadeCombustivel":
            capacidadeCombustivel == null ? null : capacidadeCombustivel,
        "ultimaLeitura": ultimaLeitura == null ? null : ultimaLeitura,
        "tipoMarcador": tipoMarcador == null ? null : tipoMarcador,
        "combustivelPadraoId":
            combustivelPadraoId == null ? null : combustivelPadraoId,
        "combustiveis": combustiveis == null
            ? null
            : List<dynamic>.from(combustiveis!.map((x) => x)),
      };

  TableMaquinaData toTableData() =>
      TableMaquinaData(id: id!, descricao: nome ?? '');

  static List<TableMaquinaData> toListTableData(List<Maquina> maquinas) =>
      maquinas.map((m) => m.toTableData()).toList();
}
