// To parse this JSON data, do
//
//     final depositoModel = depositoModelFromJson(jsonString);

import 'dart:convert';

class DepositoModel {
    DepositoModel({
        this.depositos,
        this.count,
    });

    List<Deposito>? depositos;
    int? count;

    factory DepositoModel.fromRawJson(String str) => DepositoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DepositoModel.fromJson(Map<String, dynamic> json) => DepositoModel(
        depositos: json["depositos"] == null ? null : List<Deposito>.from(json["depositos"].map((x) => Deposito.fromJson(x))),
        count: json["count"] == null ? null : json["count"],
    );

    Map<String, dynamic> toJson() => {
        "depositos": depositos == null ? null : List<dynamic>.from(depositos!.map((x) => x.toJson())),
        "count": count == null ? null : count,
    };
}

class Deposito {
    Deposito({
        this.id,
        this.nome,
    });

    String? id;
    String? nome;

    factory Deposito.fromRawJson(String str) => Deposito.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Deposito.fromJson(Map<String, dynamic> json) => Deposito(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
    };
}
