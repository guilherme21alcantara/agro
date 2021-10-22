import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformacaoAtividadeWidget extends GetView {
  final Atividade atividade;

  const InformacaoAtividadeWidget({required this.atividade});

  @override
  Widget build(BuildContext context) {
    var maquinas = '';

    atividade.maquinas!.forEach((item) {
      maquinas += '${item.descricao.toString()}, ';
    });

    if (maquinas.isNotEmpty)
      maquinas = maquinas.substring(0, maquinas.length - 2);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        atividade.cultura != null
            ? Container(
                margin: const EdgeInsets.only(
                  left: 0,
                  bottom: 5,
                ),
                child: Text(
                  "Cultura: ${atividade.cultura!.isNotEmpty ? atividade.cultura : 'Não informado'}",
                  style: ESTILO_INFORMACAO,
                ),
              )
            : Container(),
        atividade.colaboradores != null
            ? Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  atividade.colaboradores!.length > 0
                      ? "Colaboradores: ${atividade.colaboradores!.first.nome ?? ''}"
                      : "",
                  style: ESTILO_INFORMACAO,
                ),
              )
            : const Text(''),
        atividade.maquinas!.length > 0
            ? Container(
                width: 300,
                margin: const EdgeInsets.only(
                  bottom: 15,
                ),
                child: Text(
                  "Máquinas: $maquinas",
                  style: ESTILO_INFORMACAO,
                ),
              )
            : Container(),
      ],
    );
  }
}
