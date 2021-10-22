class CombustivelAbastecimentoModel {
  int? id;
  int? abastecimentoId;
  String? combustivelId;
  String? nomeCombustivel;
  int? quantidade;

  CombustivelAbastecimentoModel({
    this.id,
    this.abastecimentoId,
    this.combustivelId,
    this.quantidade,
    this.nomeCombustivel,
  });

  factory CombustivelAbastecimentoModel.fromJson(Map<String, dynamic> json) {
    int quantidade = 0;

    if (json['quantidade'].toString() != "") {
      quantidade = json['quantidade'];
    }

    return CombustivelAbastecimentoModel(
      id: json['id'],
      abastecimentoId: json['abastecimentoId'],
      combustivelId: json['combustivelId'],
      quantidade: quantidade,
      nomeCombustivel: json['nomeCombustivel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'combustivelId': combustivelId,
      'abastecimentoId': abastecimentoId,
      'quantidade': quantidade,
      'nomeCombustivel': nomeCombustivel,
    };
  }

  static List<CombustivelAbastecimentoModel> fromJsonList(List list) {
    if (list.isEmpty) {
      return [];
    }
    return list
        .map((item) => CombustivelAbastecimentoModel.fromJson(item))
        .toList();
  }
}
