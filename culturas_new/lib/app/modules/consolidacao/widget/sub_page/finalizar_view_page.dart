import '/app/data/db/my_database.dart';
import '/app/modules/consolidacao/controller.dart';
import '/app/widgets/app_bar_generic_abastecimento.dart';
import '/app/modules/abastecimento/widgets/container_customizado_texto.dart';
import '/app/modules/abastecimento/widgets/container_texto_generico_abastecimento.dart';
import '/app/modules/abastecimento/widgets/generi_card.dart';
import '/core/values/colors.dart';
import '/core/values/string.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class FinalizerViwPage extends GetView<ConsolidacaoController> {
  final TableAbastecimentoData data;

  const FinalizerViwPage({required this.data});

  @override
  Widget build(BuildContext context) {
    controller.getData(textOdometro: data.odometro, textOleo: data.oleo);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 68),
          child:
              AppBarGenericAbastecimento(title: APPBARABINFORMARASTECIMENTO)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                //const EdgeInsets.all(10),
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.agriculture,
                        color: Colors.grey[800],
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(data.nomeMaquina,
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  GeneriCard(left: 0, right: 0, title: data.nomeFazenda),
                  const SizedBox(
                    height: 20,
                  ),
                  ContainerAbast(
                    title: OLEO_DIESEL_MAQ,
                    width: Get.width,
                    maxLenght: 3,
                    controller: controller.controllerOleo,
                  ),
                  controller.getImage(data.fotoOleo),
                  ContainerGeneric(
                      title: ODOMETRO,
                      width: Get.width / 1.2,
                      controller: controller.controllerOdometro),
                  controller.getImage(data.fotoOdomentro),
                ], // <3
              ),
            ),
            Container(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 68,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: primaryColor,
                    onPressed: () => controller.showMessage(currentData: data),
                    child: const Text(
                      CONCLUIR,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
