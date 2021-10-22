import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/modules/consolidacao/widget/status_badge_consolidacao.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/utils/alert.toast.dart';
import 'package:culturas_new/core/values/constantes.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';
import 'infor_row.dart';
import 'sub_page/finalizar_view_page.dart';

class CardConsolidacaoDone extends GetView<ConsolidacaoController> {
  final List<TableAbastecimentoData> data;
  final bool filtrar;
  const CardConsolidacaoDone({required this.data, required this.filtrar});

  @override
  Widget build(BuildContext context) {
    List<TableAbastecimentoData> tempdata =
        controller.getFinalizados(data: data, ispedendent: filtrar) ?? [];

    return ListView.builder(
        itemCount: tempdata.length,
        padding: const EdgeInsets.all(20),
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () {
              if (data[index].status == CONSOLIDACAO_PENDENTE) {
                Get.to(() => FinalizerViwPage(
                      data: tempdata[index],
                    ));
              } else {
                {
                  alertToast(
                      'erro', 'Abastecimento finalizado impossivel alterar!');
                }
              }
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    StatusBadgeConsolidavao(status: tempdata[index].status),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      tempdata[index].nomeFazenda,
                      style: TITULOS_INFORMATIVOS,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InforRow(
                        title: "Maquina", value: tempdata[index].nomeMaquina),
                    const SizedBox(
                      height: 10,
                    ),
                    InforRow(
                        title: "Odometro", value: tempdata[index].odometro),
                    const SizedBox(
                      height: 10,
                    ),
                    InforRow(title: "Oléo", value: tempdata[index].oleo),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
