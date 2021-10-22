import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/modules/consolidacao/widget/card_consolidacao.done.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller.dart';

class ConsolidacaoScreem extends GetView<ConsolidacaoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            APONTAMENTO,
            style: TITULO_HEADER_STYLE,
          ),
          bottom: TabBar(
              controller: controller.controllerTab, tabs: controller.myTabs),
        ),
        body: StreamBuilder<List<TableAbastecimentoData>>(
          stream: MyDataBase.instance.abastecimentoDAO.listAll(),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            List<TableAbastecimentoData>? temp = snapshot.data;

            return TabBarView(
              controller: controller.controllerTab,
              children: [
                CardConsolidacaoDone(
                  data: temp!,
                  filtrar: true,
                ),
                CardConsolidacaoDone(
                  data: temp,
                  filtrar: false,
                )
              ],
            );
          },
        ));
  }
}
