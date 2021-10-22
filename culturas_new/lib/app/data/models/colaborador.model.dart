// To parse this JSON data, do
//
//     final colaboradorModel = colaboradorModelFromJson(jsonString);

import 'dart:convert';

class ColaboradorModel {
    ColaboradorModel({
        this.colaboradores,
    });

    List<Colaborador>? colaboradores;

    factory ColaboradorModel.fromRawJson(String str) => ColaboradorModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ColaboradorModel.fromJson(Map<String, dynamic> json) => ColaboradorModel(
        colaboradores: json["colaboradores"] == null ? null : List<Colaborador>.from(json["colaboradores"].map((x) => Colaborador.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "colaboradores": colaboradores == null ? null : List<dynamic>.from(colaboradores!.map((x) => x.toJson())),
    };
}

class Colaborador {
    Colaborador({
        this.id,
        this.nome,
    });

    String? id;
    String? nome;

    factory Colaborador.fromRawJson(String str) => Colaborador.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Colaborador.fromJson(Map<String, dynamic> json) => Colaborador(
        id: json["id"] == null ? null : json["id"],
        nome: json["nome"] == null ? null : json["nome"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
    };
}
