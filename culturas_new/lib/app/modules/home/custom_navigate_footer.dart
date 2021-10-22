import 'package:culturas_new/app/modules/home/navigate_footer_controller.dart';
import 'package:culturas_new/app/modules/home/widgets/custom_text_button.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFooterNavigation extends GetView<NavigateFooterController> {
  final String paginaAtual;

  const CustomFooterNavigation({required this.paginaAtual});

  @override
  Widget build(BuildContext context) {
    Get.put(NavigateFooterController(), permanent: true);
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(
        margin: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CustomTextButton(
                  icon: Icons.library_add,
                  paginaAtual: 'Atividades',
                  cor: paginaAtual == 'Atividades'
                      ? primaryColor!
                      : Colors.grey, //Indicadores
                  onPressed: () {
                    controller.changeScene(0);
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                CustomTextButton(
                  icon: Icons.calendar_today,
                  cor: paginaAtual == 'Indicadores'
                      ? primaryColor!
                      : Colors.grey, //Indicadores
                  paginaAtual: 'Indicadores', //Indicadores
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
