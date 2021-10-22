import 'package:culturas_new/core/theme/estilos.dart';
import 'package:flutter/material.dart';

class GenericBtnConfig extends Container {
  final String title;
  final Function() onTap;
  final Widget? icon;

  GenericBtnConfig(
      {required this.title, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // metodo logout
      child: Container(
        color: Colors.white,
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: icon,
            ),
            Text(
              title,
              style: ESTILOS_PERMISSOES,
            ),
          ],
        ),
      ),
    );
  }
}
