class Parada {
  final DateTime timeStamp;
  final String motivo;

  Parada({required this.timeStamp, required this.motivo});

  Map<String, dynamic> toJson() =>
      {"timeStamp": this.timeStamp.toIso8601String(), "motivo": this.motivo};
}
