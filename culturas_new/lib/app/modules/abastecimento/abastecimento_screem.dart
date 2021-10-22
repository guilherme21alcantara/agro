import 'package:culturas_new/app/modules/abastecimento/controller.dart';
import 'package:culturas_new/app/modules/abastecimento/sub_pagina/abastecer_screem.dart';
import 'package:culturas_new/app/widgets/botao_iniciar_atividade.dart';
import 'package:culturas_new/app/modules/abastecimento/widgets/generi_card.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_bar_generic_abastecimento.dart';

class AbastecimentoScreem extends GetView<AbastecimentoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: AppBarGenericAbastecimento(
            title: APPBARABASTECIMENTO,
          )),
      //APP BAR
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(
                  right: 17,
                  left: 17,
                  top: 15,
                ),
                child: Obx(() => InkWell(
                      onTap: controller.deposito.value.nome == null
                          ? controller.lerQrCodeDeposito
                          : controller.lerQrCodeMaquina,
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.qr_code,
                            size: 55,
                            color: Colors.grey,
                          ),
                          Obx(() => Text(
                                controller.deposito.value.nome == null
                                    ? "Ler QR code do depósito"
                                    : "Ler QR code da Maquina",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Ubuntu',
                                  color: colorblackLight,
                                  fontWeight: FontWeight.normal,
                                ),
                              )),
                        ],
                      ),
                    )),
              ),
              Obx(() => Visibility(
                    visible: controller.deposito.value.nome != null,
                    child: GeneriCard(
                      left: 17,
                      right: 17,
                      title: controller.deposito.value.nome,
                    ),
                  )),
              Obx(() => Visibility(
                    visible: controller.maquina.value.nome != null,
                    child: GeneriCard(
                      left: 17,
                      right: 17,
                      title: controller.maquina.value.nome,
                    ),
                  )),

              //BTN INICIAR ATIVIDADES APOS A LEITURA DE TODOS OS QRCOD
            ]),
          ),
          Obx(() => Visibility(
              visible: controller.maquina.value.nome != null,
              child: Container(
                  margin: const EdgeInsets.only(top: 141),
                  child: BotaoIniciarAtividadeWidget(
                    onPressed: () => Get.to(() => AbastecerScreem()),
                    title: 'Iniciar',
                  ))))
        ],
      ),
    );
  }
}
