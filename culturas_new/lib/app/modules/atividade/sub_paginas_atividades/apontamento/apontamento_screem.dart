import '/app/data/models/atividade.model.dart';
import '/app/modules/atividade/atividade_controller.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/values/string.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/custom_scrool_view.dart';

class ApontamentoScreemPage extends GetView<AtividadeController> {
  final Atividade atividade;

  const ApontamentoScreemPage({required this.atividade});
  @override
  Widget build(BuildContext context) {
    controller.convertStringinObject(atividade.perimetro!);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            APONTAMENTO,
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
                onPressed: Get.back),
          ),
        ),
        body: CustomSrollView(
          atividade: atividade,
        ));
  }
}
