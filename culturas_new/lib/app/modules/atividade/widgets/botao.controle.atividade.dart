import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/modules/atividade/sub_paginas_atividades/finalizar/finalizar_screem.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/constantes.dart';
import 'package:culturas_new/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../atividade_controller.dart';

class BotaoControleAtividadeWidget extends GetView<AtividadeController> {
  final Atividade atividade;

  const BotaoControleAtividadeWidget({required this.atividade});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: atividade.status == ATIVIDADE_PENDENTE || atividade.status == 0
          ? COLORBLUE
          : primaryColor,
      height: 135,
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          child: Column(
                            children: <Widget>[
                              atividade.status == ATIVIDADE_PENDENTE ||
                                      atividade.status == 0
                                  ? InkWell(
                                      child: const Icon(
                                        Icons.chevron_right_outlined,
                                        size: 77,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        controller.lerQrCodeDeposito();
                                      },
                                    )
                                  : InkWell(
                                      child: const Icon(
                                        Icons.check_circle_outline,
                                        size: 77,
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        //controller.temporizador!.cancel();
                                        if (atividade.insumos!.length > 0) {
                                          //Open finalizar
                                          Get.to(() => FinalizarScreem(
                                                atividade: atividade,
                                              ));
                                        } else {
                                          //finalizar aqui!
                                          controller.usuarioParado!.cancel();

                                          atividade.paradas =
                                              controller.paradas;

                                          // Limpar os dados da memória
                                          controller.paradas = [];
                                          controller.linhaHistorico = [];
                                          atividade.status =
                                              ATIVIDADE_FINALIZADA;

                                          controller
                                              .enviarAtividadeAPI(atividade);

                                          Get.offAndToNamed(Routes.ATIVIDADES);
                                        }
                                      },
                                    ),
                            ],
                          ),
                        ),
                        Text(
                          atividade.status == ATIVIDADE_PENDENTE ||
                                  atividade.status == 0
                              ? "Iniciar"
                              : "Finalizar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
