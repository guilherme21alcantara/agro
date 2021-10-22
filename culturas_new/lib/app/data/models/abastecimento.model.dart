import 'combustivel.model.dart';

class AbastecimentoModel {
  int? id;
  String? maquinaId;
  String? depositoId;
  String? nomeMaquina;
  String? descricaoCombustivels;
  DateTime? data;
  String? dataFormatada;
  double? latitude;
  double? longitude;
  String? latitudeStr;
  String? longitudeStr;
  int? leituraMarcador;
  bool? sincronizado;
  String? fotoMarcadorDaMaquina;
  String? fotoBombaAbastecimento;
  List<CombustivelModel>? combustiveis;

  AbastecimentoModel({
    this.id,
    this.data,
    this.dataFormatada,
    this.nomeMaquina,
    this.descricaoCombustivels,
    this.latitude,
    this.longitude,
    this.latitudeStr,
    this.longitudeStr,
    this.maquinaId,
    this.depositoId,
    this.leituraMarcador,
    this.combustiveis,
    this.fotoMarcadorDaMaquina,
    this.fotoBombaAbastecimento,
    this.sincronizado,
  });

  AbastecimentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maquinaId = json['maquinaId'];
    depositoId = json['depositoId'];
    sincronizado = json['sincronizado'] == "1" ? true : false;
    leituraMarcador = json['leituraMarcador'];
    fotoMarcadorDaMaquina = json['fotoMarcadorDaMaquina'];
    fotoBombaAbastecimento = json['fotoBombaAbastecimento'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    nomeMaquina = json['nomeMaquina'];
    descricaoCombustivels = json['descricaoCombustivels'];
    combustiveis = json['combustiveis'];
    data = DateTime.parse(json['data']);
  }

  Map<String, dynamic> toMap() {
    DateTime dataCadastro = DateTime.now();

    return {
       "id": id == null ? null : id,
      'data': dataCadastro.toString(),
      'sincronizado': sincronizado,
      'maquinaId': maquinaId,
      'depositoId': depositoId,
      'leituraMarcador': leituraMarcador,
      'latitude': latitude,
      'longitude': longitude,
      'descricaoCombustivels': descricaoCombustivels,
      'fotoMarcadorDaMaquina': fotoMarcadorDaMaquina,
      'fotoBombaAbastecimento': fotoBombaAbastecimento,
    };
  }

  static List<AbastecimentoModel> fromJsonList(List list) {
    
    if (list.isEmpty) {
      return [];
    }
    return list.map((item) => AbastecimentoModel.fromJson(item)).toList();
  }
}
