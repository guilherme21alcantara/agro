import '/core/theme/estilos.dart';

import 'package:flutter/material.dart';

class TituloInformativo extends StatelessWidget {
  final String title;
  const TituloInformativo({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          top: 0,
          bottom: 5,
        ),
        child: ListTile(
          title: Text(
            title,
            style: TITULOS_INFORMATIVOS,
          ),
        ),
      );
  }
}
