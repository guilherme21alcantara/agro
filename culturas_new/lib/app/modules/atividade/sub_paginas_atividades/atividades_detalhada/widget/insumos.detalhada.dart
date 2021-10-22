import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsumosDetalhadaCardWidget extends GetView {
  final InsumoAtividade? item;
  final Atividade? atividade;
  const InsumosDetalhadaCardWidget({this.item, this.atividade});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            bottom: 5,
          ),
          width: 300,
          child: Text(
            item!.descricao.toString(),
            style: ESTILO_INFORMACAO,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 5,
          ),
          width: 300,
          child: Text(
            "Dosagem por Hectare: ${atividade!.areaEmHectares.toString()} ${item!.unidade.toString()}",
            style: ESTILO_INFORMACAO,
          ),
        ),
        item != null
            ? Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Quantidade total: ${item!.quantidade.toString()} ${item!.unidade.toString()}",
                  style: ESTILO_INFORMACAO,
                ),
              )
            : const Text(''),
        Container(
          margin: const EdgeInsets.only(
            bottom: 15,
          ),
          child: const Divider(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
