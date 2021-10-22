import 'package:culturas_new/core/values/string.dart';

import '/app/modules/home/widgets/custom_float_action.dart';
import '/app/modules/home/custom_navigate_footer.dart';
import '/app/modules/indicadores/indicadores_controller.dart';
import '/app/modules/lancamentos/screem_lancamentos.dart';
import '/core/theme/estilos.dart';
import '/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indicadoresscreem extends GetView<IndicadoresController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniEndDocked,
        bottomNavigationBar: const CustomFooterNavigation(
          paginaAtual: 'Indicadores',
        ),
        floatingActionButton: CustomFloatAction(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: primaryColor,
            centerTitle: true,
            title: const Text(
              STRING_TITLE_INDICADORES,
              style: TITULO_HEADER_STYLE,
            ),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  right: 23,
                ),
                child: InkWell(
                  onTap: () async {},
                  child: const Icon(
                    Icons.sync,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
        ),
        body: ScreemLancamentos());
  }
}
