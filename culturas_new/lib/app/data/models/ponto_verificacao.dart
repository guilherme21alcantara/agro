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
      this.praga,
      this.amostragem,
      this.fase,
      this.intensidade,
      this.estrago,
      this.observacao});

  int? id;
  int? idTalhao;
  bool? isPendente;
  double? latitude;
  double? longitude;
  DateTime? dataVerificacao;
  String? foto;
  String? praga;
  String? amostragem;
  String? fase;
  String? intensidade;
  String? estrago;
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
        praga: json["praga"] == null ? null : json["praga"],
        fase: json["fase"] == null ? null : json["fase"],
        amostragem: json["amostragem"] == null ? null : json["amostragem"],
        intensidade: json["intensidade"] == null ? null : json["intensidade"],
        estrago: json["estrago"] == null ? null : json["estrago"],
        observacao: json["observacao"] == null ? null : json["observacao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "timeStamp": dataVerificacao == null ? null : dataVerificacao,
        "foto": foto == null ? null : foto,
        "praga": praga == null ? null : praga,
        "amostragem": amostragem == null ? null : amostragem,
        "fase": fase == null ? null : fase,
        "intensidade": intensidade == null ? null : intensidade,
        "estrago": estrago == null ? null : estrago,
        "observacao": observacao == null ? null : observacao,
      };
}
