import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  final String paginaAtual;
  final Color cor;

  CustomText(
      {required this.icon,
      required this.paginaAtual,
      required this.cor,
      this.onPressed});

  final page = ['Planta', 'Solo'];

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: cor,
      ),
      label: Text(paginaAtual,
          style: TextStyle(
            color: cor,
          )),
    );
  }
}
