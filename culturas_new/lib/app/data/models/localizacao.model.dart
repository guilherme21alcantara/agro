class GeoReferenciamentoModel {
  int? id;
  String? atividadeId;
  double? latitude;
  double? longitude;
  double? altitude;
  double? speed;
  DateTime? data;
  String? tipoMovimento;

  GeoReferenciamentoModel({
    this.id,
    this.atividadeId,
    this.tipoMovimento,
    this.latitude,
    this.longitude,
    this.altitude,
    this.speed,
    this.data,
  });

  GeoReferenciamentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    atividadeId = json['atividadeId'];
    tipoMovimento = json['tipoMovimento'];
    longitude = json['longitude'];
    altitude = json['altitude'];
    speed = json['speed'];
    data = DateTime.parse(json['data']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'tipoMovimento': tipoMovimento,
      'atividadeId': atividadeId,
      'altitude': altitude,
      'speed': speed,
      'data': data.toString(),
    };
  }

  static List<GeoReferenciamentoModel> fromJsonList(List list) {
    if (list.isEmpty) {
      return [];
    }
    return list.map((item) => GeoReferenciamentoModel.fromJson(item)).toList();
  }
}
