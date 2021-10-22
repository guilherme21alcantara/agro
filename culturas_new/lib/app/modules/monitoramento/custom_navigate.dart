import 'package:culturas_new/app/modules/monitoramento/custom_navigate_controller.dart';
import 'package:culturas_new/app/modules/monitoramento/widgets/custom_tex.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomNavigation extends GetView<NavigateController> {
  final String paginaAtual;

  const CustomNavigation({required this.paginaAtual});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigateController(), permanent: true);
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(
        margin: const EdgeInsets.only(left: 22.0, right: 45.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 80,
                ),
                CustomText(
                  icon: MdiIcons.sprout,
                  paginaAtual: 'Planta',
                  cor: paginaAtual == 'Planta'
                      ? primaryColor!
                      : Colors.grey, //Indicadores
                  onPressed: () {
                    controller.changeScene(0);
                  },
                ),
                const SizedBox(
                  width: 40,
                ),
                CustomText(
                  icon: MdiIcons.grass,
                  cor: paginaAtual == 'Solo'
                      ? primaryColor!
                      : Colors.grey, //Indicadores
                  paginaAtual: 'Solo', //Indicadores
                  onPressed: () {
                    controller.changeScene(1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
