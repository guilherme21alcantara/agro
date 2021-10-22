import 'package:culturas_new/app/data/models/parada.model.dart';
import 'package:culturas_new/app/modules/mapa/mapa.dart';
import 'package:jiffy/jiffy.dart';

import '../../../atividade_controller.dart';
import '/app/modules/atividade/widgets/botao.controle.atividade.dart';
import '/app/modules/atividade/sub_paginas_atividades/atividades_detalhada/widget/informacao.atividade.dart';
import '/app/modules/atividade/sub_paginas_atividades/atividades_detalhada/widget/insumos.detalhada.dart';

import '/app/data/models/atividade.model.dart';
import '/core/theme/estilos.dart';
import '/core/values/colors.dart';
import '/core/values/constantes.dart';

import 'package:flutter/material.dart';

class CorpoAtividadeDetalhada extends StatelessWidget {
  final Atividade? atividade;
  final AtividadeController controller;

  const CorpoAtividadeDetalhada({this.atividade, required this.controller});
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetsInsumos = atividade!.insumos!
        .map(
          (objItem) => InsumosDetalhadaCardWidget(
            item: objItem,
            atividade: atividade,
          ),
        )
        .toList();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 0),
                  child: /*Mapa(
                        perimetro: atividade!.perimetro.toString(),
                        atividade: atividade!,
                        statusAtividade: atividade!.status!)*/
                      Container(),
                ),
                Container(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 0),
                    child: Divider()),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 250,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 20,
                          ),
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ListTile(
                                  dense: true,
                                  title: Text(
                                    atividade!.atividade.toString(),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  dense: true,
                                  title: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 3,
                                    ),
                                    child: Text(
                                      atividade!.area.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: primaryColor,
                                        fontFamily: 'Ubuntu',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    atividade!.subArea.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    atividade!.fazenda!.nome ?? '',
                                    style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 16,
                                      fontFamily: 'Ubuntu',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                const ListTile(
                                  dense: true,
                                  title: Text(
                                    'Informações',
                                    style: TITULOS_INFORMATIVOS,
                                  ),
                                ),
                                InformacaoAtividadeWidget(
                                  atividade: atividade!,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                ListTile(
                                  dense: true,
                                  title: atividade!.insumos!.length > 0
                                      ? const Text(
                                          'Insumos',
                                          style: TITULOS_INFORMATIVOS,
                                        )
                                      : const Text(''),
                                ),
                                Form(
                                  //  key: _formKey,
                                  child: Column(
                                    children: widgetsInsumos,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          atividade!.status != ATIVIDADE_FINALIZADA
              ? BotaoControleAtividadeWidget(
                  atividade: atividade!,
                )
              : DetalhesAtividadeFinalizada(
                  controller: controller,
                  atividade: atividade,
                ),

          // BotaoTempoAtividadeWidget(),
        ],
      ),
    );
  }
}

class DetalhesAtividadeFinalizada extends StatelessWidget {
  const DetalhesAtividadeFinalizada({
    required this.controller,
    required this.atividade,
  });

  final AtividadeController controller;
  final Atividade? atividade;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hora de Inicio:",
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              child: Text(
                  controller
                      .obterRegistroTempoAtividade(atividade!)['horaInicio']!,
                  style: TextStyle(fontSize: 18)),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child:
                    Text("Hora de Conclusão:", style: TextStyle(fontSize: 24))),
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              child: Text(
                  controller.obterRegistroTempoAtividade(
                      atividade!)['horaConclusao']!,
                  style: TextStyle(fontSize: 18)),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Duração da atividade:",
                    style: TextStyle(fontSize: 24))),
            Container(
              padding: EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              child: Text(
                  controller
                      .obterRegistroTempoAtividade(atividade!)['duracao']!,
                  style: TextStyle(fontSize: 18)),
            ),
            Text("Paradas:", style: TextStyle(fontSize: 28)),
            for (Parada parada in atividade!.paradas!)
              ListTile(
                leading: parada.motivo == "Abastecimento"
                    ? Icon(Icons.local_gas_station)
                    : Icon(Icons.settings),
                title: Text(parada.motivo),
                trailing:
                    Text(Jiffy(parada.timeStamp).format("dd/MM/yyyy HH:MM")),
              )
          ],
        ));
  }
}
