class UsuarioModel{

  int? id;
  String? nome;

  
  UsuarioModel({this.id, this.nome});
  
  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
  }

  Map<String, dynamic> toMap() {

    return {
      'id': id,
      'nome': nome,
    };

  }

  static List<UsuarioModel> fromJsonList(List list) {
    if (list.isEmpty) {
      return [];
    }
    return list.map((item) => UsuarioModel.fromJson(item)).toList();
  }

}
