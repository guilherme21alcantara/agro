import 'dart:convert' as Convert;

import 'package:culturas_new/app/data/models/ponto_verificacao.dart';

class Talhao {
  Talhao({this.id, this.nome, this.geometria, this.pontosVerificacao});

  int? id;
  String? nome;
  List<List<double>>? geometria;
  List<PontoVerificacao>? pontosVerificacao;

  factory Talhao.fromRawJson(String str) =>
      Talhao.fromJson(Convert.json.decode(str));

  String toRawJson() => Convert.json.encode(toJson());

  factory Talhao.fromJson(Map<String, dynamic> json) => Talhao(
      id: json["id"] == null ? null : json["id"],
      nome: json["name"] == null ? null : json["name"],
      geometria: json["geometria"] == null
          ? null
          : Convert.json.decode(json["geometria"]),
      pontosVerificacao: json["pontosVerificacao"] == null
          ? null
          : List<PontoVerificacao>.from(json["pontosVerificacao"]
              .map((x) => PontoVerificacao.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nome": nome == null ? null : nome,
        "geometria": geometria == null ? null : geometria,
        "pontosVerificacao": pontosVerificacao == null
            ? null
            : List<dynamic>.from(pontosVerificacao!.map((x) => x.toJson()))
      };
}
