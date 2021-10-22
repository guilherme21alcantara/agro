import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';

class AppBarGenericAbastecimento extends Container {
  final String title;

  AppBarGenericAbastecimento({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: primaryColor,
      centerTitle: true,
      title: Text(
        title,
        style: TITULO_HEADER_STYLE,
      ),
    );
  }
}
