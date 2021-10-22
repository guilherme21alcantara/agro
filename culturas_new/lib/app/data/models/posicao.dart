// To parse this JSON data, do
//
//     final posicaoModel = posicaoModelFromJson(jsonString);

import 'dart:convert';

class PosicaoModel {
  PosicaoModel({
    this.posicoes,
  });

  List<Posicao>? posicoes;

  factory PosicaoModel.fromRawJson(String str) =>
      PosicaoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PosicaoModel.fromJson(Map<String, dynamic> json) => PosicaoModel(
        posicoes: json["posicoes"] == null
            ? null
            : List<Posicao>.from(
                json["posicoes"].map((x) => Posicao.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "posicoes": posicoes == null
            ? null
            : List<dynamic>.from(posicoes!.map((x) => x.toJson())),
      };
}

class Posicao {
  Posicao({
    this.id,
    this.idAtividade,
    this.latitude,
    this.longitude,
    this.timeStamp,
  });

  String? id;
  String? idAtividade;
  double? latitude;
  double? longitude;
  DateTime? timeStamp;

  factory Posicao.fromRawJson(String str) => Posicao.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Posicao.fromJson(Map<String, dynamic> json) => Posicao(
        id: json["id"] == null ? null : json["id"],
        idAtividade: json["idAtividade"] == null ? null : json["idAtividade"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        timeStamp: json["timeStamp"] == null ? null : json["timeStamp"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "timeStamp": timeStamp == null ? null : timeStamp!.toIso8601String(),
      };
}
