import 'package:culturas_new/app/widgets/app_bar_generic_abastecimento.dart';
import 'package:culturas_new/app/modules/abastecimento/widgets/card_image.dart';
import 'package:culturas_new/app/modules/abastecimento/widgets/container_customizado_texto.dart';
import 'package:culturas_new/app/modules/abastecimento/widgets/container_generico_abastecimento.dart';
import 'package:culturas_new/app/modules/abastecimento/widgets/container_texto_generico_abastecimento.dart';
import 'package:culturas_new/app/modules/abastecimento/widgets/generi_card.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller.dart';

class AbastecerScreem extends GetView<AbastecimentoController> {
  @override
  Widget build(BuildContext context) {
    var _sizer = MediaQuery.of(context).size;
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
                      Text(controller.maquina.value.nome.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  GeneriCard(
                    left: 0,
                    right: 0,
                    title: controller.deposito.value.nome,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ContainerAbast(
                    title: OLEO_DIESEL_MAQ,
                    width: _sizer.width,
                    maxLenght: 3,
                    controller: controller.controllerEditOleo,
                  ),
                  Obx(() => Visibility(
                      visible: !controller.isImage1.value,
                      child: Containergeral(
                        title: FOTO_DA_BOMBA,
                        width: _sizer.width,
                        ontap: () => controller.camera(FOTO_DA_BOMBA),
                      ),
                      replacement: CardImage(
                        pathImage: controller.fileimage1.value,
                      ))),
                  ContainerGeneric(
                      title: ODOMETRO,
                      width: _sizer.width / 1.2,
                      controller: controller.controllerEditOdometro),
                  Obx(() => Visibility(
                        visible: !controller.isImage2.value,
                        child: Containergeral(
                          title: FOTO_DO_ODOMETRO,
                          width: _sizer.width,
                          ontap: () => controller.camera(FOTO_DO_ODOMETRO),
                        ),
                        replacement: CardImage(
                          pathImage: controller.fileimage2.value,
                        ),
                      )),
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
                    onPressed: controller.showMessage,
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
