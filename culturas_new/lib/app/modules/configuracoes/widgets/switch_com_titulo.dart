import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SwitchComTitulo extends GetView {
  final String title;
  final RxBool active;

  const SwitchComTitulo({required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: ESTILOS_PERMISSOES,
          ),
          Obx(
            () => FlutterSwitch(
              activeText: "ON.",
              inactiveText: ".OFF",
              value: active.value,
              valueFontSize: 10.0,
              activeColor: primaryColor!,
              borderRadius: 30.0,
              showOnOff: true,
              disabled: active.value,
              onToggle: (val) {
                active.value = val;
              },
            ),
          ),
        ],
      ),
    );
  }
}
