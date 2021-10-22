import 'package:culturas_new/app/modules/atividade/atividade_controller.dart';
import 'package:culturas_new/app/modules/monitoramento/monitoramento_screen.dart';
import 'package:culturas_new/app/modules/monitoramento/widgets/mapa_monitoramento.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CustomFloatAction extends StatelessWidget {
  AtividadeController controller = Get.find<AtividadeController>();

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      activeBackgroundColor: Colors.red,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      buttonSize: 56,
      childrenButtonSize: 56.0,

      tooltip: 'nice Day',

      backgroundColor: primaryColor,
      elevation: 8.0,
      isOpenOnStart: false,
      animationSpeed: 200,

      // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.local_gas_station),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: 'Abastecimento',
          onTap: () => Get.toNamed(Routes.ABASTECIMENTO),
        ),
        SpeedDialChild(
          child: const Icon(MdiIcons.water),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: 'Pluviometria',
          onTap: () => Get.toNamed(Routes.PLUVIAMETRIA),
        ),
        SpeedDialChild(
          child: const Icon(MdiIcons.sprout),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: 'Crescimento',
          onTap: () => null,
        ),
        SpeedDialChild(
          child: const Icon(Icons.track_changes),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          label: 'Monitoramento',
          onTap: () => Get.to(() => MonitoramentoScreen()),
        ),
      ],
    );
  }
}
