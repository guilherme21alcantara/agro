import 'package:get/get.dart';

import '/app/data/models/atividade.model.dart';
import '/app/modules/atividade/atividade_controller.dart';
import '/core/utils/convert_cores.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MaquinaCardWidget extends GetView<AtividadeController> {
  final Atividade item;
  const MaquinaCardWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    controller.getNameMaquina(
        idMaquina: item.maquinas?.first
            .maquinaId); // TODO teste de recuperacao de nome de maquina
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 116,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 0,
          right: 10,
          left: 10,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                padding: const EdgeInsets.all(18),
                child: InkWell(
                  child: ListTile(
                    dense: true,
                    title: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.agriculture,
                          color: Colors.grey,
                          size: 35,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Obx(() => Visibility(
                                  visible: controller.nomeMaquina.value != '',
                                  child: Text(
                                    controller.nomeMaquina.value,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ))),
                              item.maquinas!.length == 1
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 20,
                                    )
                                  : const Text(''),
                            ],
                          ),
                        )
                      ],
                    ),
                    subtitle: InkWell(
                      onTap: () async => controller.lerQrCodeDeposito(),
                      child: Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: <Widget>[
                            const Icon(
                              Icons.qr_code,
                              size: 24,
                              color: Colors.grey,
                            ),
                            Text(
                              " Ler código da máquina",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                color: hexToColor("#3F4349"),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
