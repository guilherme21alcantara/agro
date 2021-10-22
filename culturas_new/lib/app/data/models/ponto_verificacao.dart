import 'dart:convert';

class PontoVerificacao {
  PontoVerificacao(
      {this.id,
      this.idTalhao,
      this.isPendente,
      this.latitude,
      this.longitude,
      this.dataVerificacao,
      this.foto,
      this.observacao});

  int? id;
  int? idTalhao;
  bool? isPendente;
  double? latitude;
  double? longitude;
  DateTime? dataVerificacao;
  String? foto;
  String? observacao;

  factory PontoVerificacao.fromRawJson(String str) =>
      PontoVerificacao.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PontoVerificacao.fromJson(Map<String, dynamic> json) =>
      PontoVerificacao(
        id: json["id"] == null ? null : json["id"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        dataVerificacao:
            json["dataVerificacao"] == null ? null : json["dataVerificacao"],
        foto: json["foto"] == null ? null : json["foto"],
        observacao: json["observacao"] == null ? null : json["observacao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "timeStamp": dataVerificacao == null ? null : dataVerificacao,
        "foto": foto == null ? null : foto,
        "observacao": observacao == null ? null : observacao,
      };
}
