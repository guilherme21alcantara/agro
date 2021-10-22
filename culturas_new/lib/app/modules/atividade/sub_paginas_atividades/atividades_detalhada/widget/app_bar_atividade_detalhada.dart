import 'package:culturas_new/core/theme/estilos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../atividade_controller.dart';

class AppBarAtividadeDetalhada extends StatelessWidget {
  final AtividadeController controller;

  const AppBarAtividadeDetalhada({Key? key, required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: AppBar(
        centerTitle: true,
        title: const Text(
          "Detalhes da atividade",
          style: TITULO_HEADER_STYLE,
        ),
        leading: Container(
          margin: const EdgeInsets.only(
            left: 20,
          ),
          child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                //controller.temporizador!.cancel();
                Get.back();
              }),
        ),
      ),
    );
  }
}
