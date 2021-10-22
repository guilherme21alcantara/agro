class ConfiguracaoModel {
  int? id;
  int? fazendaId;
  String? nomeFazenda;

  ConfiguracaoModel({this.id, this.nomeFazenda, this.fazendaId});

  ConfiguracaoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeFazenda = json['nomeFazenda'];
    fazendaId = json['fazendaId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeFazenda': nomeFazenda,
      'fazendaId': fazendaId,
    };
  }

  static List<ConfiguracaoModel> fromJsonList(List list) {
    if (list.isEmpty) {
      return [];
    }
    return list.map((item) => ConfiguracaoModel.fromJson(item)).toList();
  }
}
