import 'dart:io';

import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final File pathImage;

  const CardImage({required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: MediaQuery.of(context).size.width / 6,
        width: double.infinity,
        child: Image.file(
          pathImage,
        ), //TODO APENAS PARA EXEMPLO
      ),
    );
  }
}
