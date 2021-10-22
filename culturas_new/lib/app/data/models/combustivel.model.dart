// To parse this JSON data, do
//
//     final combustivelModel = combustivelModelFromJson(jsonString);

import 'dart:convert';

class CombustivelModel {
    CombustivelModel({
        this.combustiveis,
        this.count,
    });

    List<Combustivei>? combustiveis;
    int? count;

    factory CombustivelModel.fromRawJson(String str) => CombustivelModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CombustivelModel.fromJson(Map<String, dynamic> json) => CombustivelModel(
        combustiveis: json["combustiveis"] == null ? null : List<Combustivei>.from(json["combustiveis"].map((x) => Combustivei.fromJson(x))),
        count: json["count"] == null ? null : json["count"],
    );

    Map<String, dynamic> toJson() => {
        "combustiveis": combustiveis == null ? null : List<dynamic>.from(combustiveis!.map((x) => x.toJson())),
        "count": count == null ? null : count,
    };
}

class Combustivei {
    Combustivei({
        this.id,
        this.nome,
    });

    String? id;
    String? nome;

    factory Combustivei.fromRawJson(String str) => Combustivei.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Combustivei.fromJson(Map<String, dynamic> json) => Combustivei(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
    };
}
