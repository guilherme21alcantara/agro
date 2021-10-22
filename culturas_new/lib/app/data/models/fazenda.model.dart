// To parse this JSON data, do
//
//     final fazendaModel = fazendaModelFromJson(jsonString);

import 'dart:convert';

import 'package:culturas_new/app/data/models/atividade.model.dart';

class FazendaModel {
  FazendaModel({
    this.fazendas,
  });

  List<Fazenda>? fazendas;

  factory FazendaModel.fromRawJson(String str) =>
      FazendaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FazendaModel.fromJson(Map<String, dynamic> json) => FazendaModel(
        fazendas: json["fazendas"] == null
            ? null
            : List<Fazenda>.from(
                json["fazendas"].map((x) => Fazenda.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fazendas": fazendas == null
            ? null
            : List<dynamic>.from(fazendas!.map((x) => x.toJson())),
      };
}

class Fazenda {
  Fazenda({this.id, this.nome, this.codigoParceiro, this.colaboradores});

  String? id;
  String? nome;
  List<ColaboradorAtividade>? colaboradores;
  String? codigoParceiro;

  factory Fazenda.fromRawJson(String str) => Fazenda.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Fazenda.fromJson(Map<String, dynamic> json) => Fazenda(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        codigoParceiro:
            json["codigoParceiro"] == null ? null : json["codigoParceiro"],
        colaboradores: json["colaboradores"] == null
            ? null
            : List<ColaboradorAtividade>.from(json["colaboradores"]
                .map((x) => ColaboradorAtividade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "codigoParceiro": codigoParceiro == null ? null : codigoParceiro,
        "colaboradores": colaboradores == null
            ? null
            : List<dynamic>.from(colaboradores!.map((x) => x.toJson())),
      };
}
