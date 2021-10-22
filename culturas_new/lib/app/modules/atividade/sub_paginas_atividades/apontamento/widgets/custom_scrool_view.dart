import '/app/data/models/atividade.model.dart';
import '/app/modules/atividade/atividade_controller.dart';
import '/app/modules/atividade/sub_paginas_atividades/apontamento/widgets/titulo_informativo.dart';
import '/app/modules/atividade/sub_paginas_atividades/atividades_detalhada/atividade.detalhada.dart';
import '/app/widgets/botao_iniciar_atividade.dart';
import '/app/widgets/insumo.card.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/values/constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'maquina.card.dart';

class CustomSrollView extends GetView<AtividadeController> {
  final Atividade? atividade;

  const CustomSrollView({required this.atividade});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    if (atividade!.maquinas!.length > 0) {
                      return const TituloInformativo(title: "Máquinas:");
                    }

                    return TituloInformativo(
                        title: atividade!.atividade.toString());
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    return MaquinaCardWidget(
                      item: atividade!,
                    );
                  },
                  childCount: atividade!.maquinas!.length,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    if (atividade!.maquinas!.length == 0) {
                      return const Text('');
                    }
                    return const TituloInformativo(title: "Insumos:");
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    return InsumoCardWidget(
                      item: atividade!.insumos![i],
                    );
                  },
                  childCount: atividade!.maquinas!.length,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: const Text(
                              'Área em hectares',
                              style: TITULOS_INFORMATIVOS,
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(
                                top: 12,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: TextFormField(
                                initialValue:
                                    atividade?.areaEmHectares.toString(),
                                enabled: false,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  labelText: "Ha",
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Informe a quantidade";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
        BotaoIniciarAtividadeWidget(
            title: 'Iniciar Atividade',
            onPressed: () {
              //TODO AQUI QUE TENHO QUE ENVIAR PRO BANCO DE DADOS E INCIALIZAR A ATIVIDADE
              atividade!.status = ATIVIDADE_EM_ANDAMENTO;

              Get.off(DetalhesAtividadeView(
                atividade: atividade,
                id: atividade!.id.toString(),
                controller: controller,
              ));
            })
      ],
    );
  }
}
