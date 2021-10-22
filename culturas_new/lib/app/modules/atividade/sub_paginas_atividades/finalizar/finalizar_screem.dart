import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/modules/atividade/atividade_controller.dart';
import 'package:culturas_new/app/modules/atividade/sub_paginas_atividades/finalizar/widget/botao_finalizar.dart';
import 'package:culturas_new/app/modules/atividade/sub_paginas_atividades/finalizar/widget/generic_field_finalizar.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinalizarScreem extends GetView<AtividadeController> {
  final Atividade atividade;

  const FinalizarScreem({required this.atividade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            FINALIZAR,
            style: TITULO_HEADER_STYLE,
          ),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TITLE

                      Text('Insumos:', style: TITULOS_INFORMATIVOS),

                      Padding(
                        padding: EdgeInsets.all(6),
                      ),
                      //CORPO
                      Column(
                        children: [
                          GenericFieldFinalizar(
                              txtController: controller.txtQuantidadeInsumoController,
                              hint: 'Quantidade de insumos utilizada: ',
                              label: atividade.insumos!.first.quantidade
                                  .toString()),
                          Padding(
                            padding: EdgeInsets.all(12),
                          ),
                          GenericFieldFinalizar(
                              txtController: controller.txtHectareController,
                              hint: 'Aréa em hectares: ',
                              label: atividade.areaEmHectares.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                BotaoFinalizar(atividade: atividade)
              ],
            ),
          ),
        ));
  }
}
