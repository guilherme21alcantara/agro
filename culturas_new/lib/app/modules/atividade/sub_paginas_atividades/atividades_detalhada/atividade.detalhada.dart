//flutter
import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../atividade_controller.dart';
import 'widget/app_bar_atividade_detalhada.dart';
import 'widget/corpo_atividade_detalhada.dart';
//lib

class DetalhesAtividadeView extends StatefulWidget {
  final String id;
  final Atividade? atividade;
  final AtividadeController controller;

  const DetalhesAtividadeView(
      {required this.id, required this.atividade, required this.controller});

  @override
  _DetalhesAtividadeViewState createState() => _DetalhesAtividadeViewState();
}

class _DetalhesAtividadeViewState extends State<DetalhesAtividadeView> {
  @override
  void initState() {
    widget.atividade!.dadosTelemetria =
        widget.atividade!.dadosTelemetria == null
            ? []
            : widget.atividade!.dadosTelemetria;
    widget.atividade!.paradas =
        widget.atividade!.paradas == null ? [] : widget.atividade!.paradas;
    super.initState();
  }

  @override
  void dispose() {
    //widget.controller.temporizador!.cancel();
    //widget.controller.usuarioParado!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 55),
          child: AppBarAtividadeDetalhada(controller: widget.controller)),
      body: widget.atividade == null
          ? Center(child: CircularProgressIndicator())
          : CorpoAtividadeDetalhada(
              atividade: widget.atividade,
              controller: widget.controller,
            ),
    );
  }
}
