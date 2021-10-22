import 'package:culturas_new/app/data/models/parada.model.dart';
import 'package:culturas_new/app/modules/atividade/atividade_controller.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';

class ParadaModal extends StatelessWidget {
  final AtividadeController controller;
  const ParadaModal({required this.controller});

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
              "PARADO PARA:",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  controller.paradas.add(
                      Parada(timeStamp: DateTime.now(), motivo: "Manutenção"));
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.settings, size: 48, color: Colors.white),
                      Text(
                        "Manutenção",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.paradas.add(Parada(
                      timeStamp: DateTime.now(), motivo: "Abastecimento"));
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.local_gas_station,
                          size: 48, color: Colors.white),
                      Text(
                        "Abastecimento",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
