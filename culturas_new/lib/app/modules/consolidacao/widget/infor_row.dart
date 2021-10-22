import 'package:culturas_new/core/theme/estilos.dart';
import 'package:flutter/material.dart';

class InforRow extends StatelessWidget {
  final String title;
  final String value;
  const InforRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            '$title:',
            style: TITULOS_INFORMATIVOS,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: ESTILO_INFORMACAO,
          ),
        ),
      ],
    );
  }
}
