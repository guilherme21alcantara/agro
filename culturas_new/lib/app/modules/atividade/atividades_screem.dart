import 'dart:convert';
import 'dart:ui';

import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/modules/atividade/sub_paginas_atividades/atividades_detalhada/atividade.detalhada.dart';
import 'package:culturas_new/app/modules/mapa/mapa-testes.dart';
import 'package:culturas_new/core/values/constantes.dart';

import '/app/modules/atividade/atividade_controller.dart';
import '/app/modules/atividade/widgets/atividade.card.dart';
import '/app/modules/home/custom_navigate_footer.dart';
import '/app/modules/home/widgets/custom_float_action.dart';
import '/routes/pages.dart';
import '/core/theme/estilos.dart';
import '/core/values/colors.dart';
import '/core/values/string.dart';

//flutter
import 'package:flutter/material.dart';

//libs
import 'package:get/get.dart';

import 'sub_paginas_atividades/apontamento/apontamento_screem.dart';

class AtividadesScreem extends GetView<AtividadeController> {
  @override
  Widget build(BuildContext context) {
    Get.find<AtividadeController>();
    return Scaffold(
        bottomNavigationBar: const CustomFooterNavigation(
          paginaAtual: TITLEATIVIDADES,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        floatingActionButton: CustomFloatAction(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            backgroundColor: primaryColor,
            brightness: Brightness.dark,
            centerTitle: true,
            title: const Text(
              TITLEATIVIDADES,
              style: TITULO_HEADER_STYLE,
            ),
            leading: InkWell(
              onTap: () async {
                Get.toNamed(Routes.CONFIGURACOES);
              },
              child: Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                child: const Icon(
                  Icons.settings,
                  size: 20,
                ),
              ),
            ),
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  right: 23,
                ),
                child: InkWell(
                  onTap: () async {
                    await controller.sincronizar();
                  },
                  child: const Icon(Icons.sync),
                ),
              ),
              // IconButton(
              //     onPressed: () {
              //       Get.to(() => MapaTest(controller: controller));
              //     },
              //     icon: Icon(Icons.map)),
            ],
          ),
        ),
        // TODO Pedir para o usuario sicronizar
        body: Container(
          padding: const EdgeInsets.only(top: 30),
          width: double.infinity,
          child: FutureBuilder<List<Atividade>>(
              future: controller.getAtividadesBancoDeDados(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return Container(
                      child: Obx(() => ListView.builder(
                            itemCount: controller.atividadesRx.length,
                            itemBuilder: (context, i) {
                              return AtividadeCardWidget(
                                atividade: controller.atividadesRx[i],
                                onTap: () {
                                  if (controller.atividadesRx[i].status !=
                                      ATIVIDADE_PENDENTE) {
                                    Get.to(() => DetalhesAtividadeView(
                                          id: controller.atividadesRx[i].id!,
                                          atividade: controller.atividadesRx[i],
                                          controller: controller,
                                        ));
                                  } else if (controller
                                          .atividadesRx[i].status ==
                                      ATIVIDADE_PENDENTE) {
                                    Get.to(() => ApontamentoScreemPage(
                                          atividade: controller.atividadesRx[i],
                                        ));
                                  }
                                },
                              );
                            },
                          )),
                    );
                  } else {
                    return AvisoSicroniaAtividadeWidget();
                  }
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}

class AvisoSicroniaAtividadeWidget extends StatelessWidget {
  const AvisoSicroniaAtividadeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(24),
                  child: Icon(Icons.warning,
                      color: Colors.grey.shade700, size: 96)),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 24),
                      children: [
                        TextSpan(
                            text:
                                "Não foram encontrados registros de atividades no banco.\n\n"),
                        TextSpan(text: "Toque no ícone "),
                        WidgetSpan(
                            child: Icon(Icons.sync,
                                color: Colors.grey.shade700, size: 36)),
                        TextSpan(text: " para carregar os dados do servidor."),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
