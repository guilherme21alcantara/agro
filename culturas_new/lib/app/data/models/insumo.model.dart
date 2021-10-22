// To parse this JSON data, do
//
//     final insumoModel = insumoModelFromJson(jsonString);

import 'dart:convert';

class InsumoModel {
  InsumoModel({
    this.insumos,
  });

  List<Insumo>? insumos;

  factory InsumoModel.fromRawJson(String str) =>
      InsumoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InsumoModel.fromJson(Map<String, dynamic> json) => InsumoModel(
        insumos: json["insumos"] == null
            ? null
            : List<Insumo>.from(json["insumos"].map((x) => Insumo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "insumos": insumos == null
            ? null
            : List<dynamic>.from(insumos!.map((x) => x.toJson())),
      };
}

class Insumo {
  Insumo({
    this.id,
    this.nome,
    this.unidade,
  });

  String? id;
  String? nome;
  String? unidade;

  factory Insumo.fromRawJson(String str) => Insumo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Insumo.fromJson(Map<String, dynamic> json) => Insumo(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
        unidade: json["unidade"] == null ? null : json["unidade"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "unidade": unidade == null ? null : unidade,
      };
}
