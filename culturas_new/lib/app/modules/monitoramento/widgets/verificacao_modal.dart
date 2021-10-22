//@dart=2.9
import 'dart:io';

import 'package:culturas_new/app/data/models/ponto_verificacao.dart';
import 'package:culturas_new/app/modules/monitoramento/widgets/detalhes_verificacao_screen.dart';
import 'package:culturas_new/app/modules/monitoramento/widgets/form_verificacao.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../monitoramento_controller.dart';

class VerificacaoModal extends StatefulWidget {
  final PontoVerificacao pontoVerificacao;
  final int idTalhao;
  const VerificacaoModal({this.pontoVerificacao, this.idTalhao});

  @override
  _VerificacaoModalState createState() => _VerificacaoModalState();
}

class _VerificacaoModalState extends State<VerificacaoModal> {
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.all(18),
            child: Text(
              "O QUE FAZER:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          widget.pontoVerificacao.isPendente
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Get.to(FormVerificacaoScreen(
                          pontoVerificacao: widget.pontoVerificacao,
                          idTalhao: widget.idTalhao,
                        ));
                        sleep(Duration(seconds: 1));
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.add, size: 48, color: Colors.white),
                            Text(
                              "Adicionar\nOcorrência",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Get.to(DetalhesVerificacaoScreen(
                            pontoVerificacao: widget.pontoVerificacao));
                        sleep(Duration(seconds: 1));
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.search, size: 48, color: Colors.white),
                            Text(
                              "Ver Ocorrência",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await Get.to(FormVerificacaoScreen(
                          pontoVerificacao: widget.pontoVerificacao,
                          idTalhao: widget.idTalhao,
                        ));
                        sleep(Duration(seconds: 1));
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit, size: 48, color: Colors.white),
                            Text(
                              "Editar\nOcorrência",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
