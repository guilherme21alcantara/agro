class CombustivelMaquina {
  int? id;
  String? combustivelId;
  String? maquinaId;
  String? nomeCombustivel;

  CombustivelMaquina({
    this.id,
    this.nomeCombustivel,
    this.combustivelId,
    this.maquinaId,
  });

  factory CombustivelMaquina.fromJson(Map<String, dynamic> json) {
    return CombustivelMaquina(
      id: json['id'],
      combustivelId: json['combustivelId'],
      maquinaId: json['maquinaId'],
      nomeCombustivel: json['nomeCombustivel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maquinaId': maquinaId,
      'combustivelId': combustivelId,
    };
  }

  static List<CombustivelMaquina> fromJsonList(List list) {
    if (list.isEmpty) {
      return [];
    }
    return list.map((item) => CombustivelMaquina.fromJson(item)).toList();
  }
}
