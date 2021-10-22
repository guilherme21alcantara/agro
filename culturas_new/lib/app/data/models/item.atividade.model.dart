class ItemAtividadeModel {
  int? id;
  String? atividadeId;
  String? maquinaId;
  String? insumoId;
  int? qrcodeVerificado;
  String? descricao;
  String? unidade;
  double? quantidade;
  String? quantidadeTotal;

  ItemAtividadeModel({
    this.id,
    this.maquinaId,
    this.insumoId,
    this.descricao,
    this.quantidade,
    this.unidade,
    this.qrcodeVerificado,
    this.atividadeId,
    this.quantidadeTotal,
  });

  factory ItemAtividadeModel.fromJson(Map<String, dynamic> json) {
    double quantidade = 0;

    if (json['quantidade'].toString() != "") {
      quantidade = json['quantidade'];
    }

    String quantidadeTotal = '0';

    if (json['quantidadeTotal'].toString() != "") {
      quantidadeTotal = json['quantidadeTotal'];
    }

    if (quantidadeTotal.isEmpty) {
      quantidadeTotal = '0';
    }

    return ItemAtividadeModel(
      id: json['id'],
      descricao: json['descricao'],
      maquinaId: json['maquinaId'],
      insumoId: json['insumoId'],
      quantidade: quantidade,
      unidade: json['unidade'],
      quantidadeTotal: quantidadeTotal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'unidade': unidade,
      'qrcodeVerificado': qrcodeVerificado,
      'quantidadeTotal': quantidadeTotal,
      'atividadeId': atividadeId,
      'maquinaId': maquinaId,
      'insumoId': insumoId,
    };
  }

  static List<ItemAtividadeModel> fromJsonList(List list) {
    if (list.isEmpty) {
      return [];
    }
    return list.map((item) => ItemAtividadeModel.fromJson(item)).toList();
  }
}
