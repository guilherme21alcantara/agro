import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/modules/atividade/atividade_controller.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/constantes.dart';
import 'package:culturas_new/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BotaoFinalizar extends GetView<AtividadeController> {
  final Atividade atividade;

  const BotaoFinalizar({required this.atividade});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      color: secondaryColor,
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
                              InkWell(
                                child: const Icon(
                                  Icons.check_circle_outline,
                                  size: 77,
                                  color: Colors.white,
                                ),
                                onTap: () async {
                                  if (controller
                                      .validarcamposatividades(atividade)) {
                                    controller.usuarioParado!.cancel();

                                    atividade.paradas = controller.paradas;

                                    // Limpar os dados da memória
                                    controller.paradas = [];
                                    controller.linhaHistorico = [];
                                    atividade.status = ATIVIDADE_FINALIZADA;

                                    controller.enviarAtividadeAPI(atividade);
                                    //await controller.salvar(atividade);
                                    Get.offAndToNamed(Routes.ATIVIDADES);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          "Finalizar",
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
