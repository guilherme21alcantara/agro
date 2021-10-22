import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/core/utils/convert_cores.dart';
import 'package:flutter/material.dart';

class StatusBadgeWidget extends StatelessWidget {
  final Atividade atividade;

  const StatusBadgeWidget({required this.atividade});

  _getConfigStatus(int? statusId) {
    if (statusId == null || statusId == 0) {
      statusId = 1;
    }

    var configuracoesStatus = {
      1: {
        'icone': Icons.timer,
        'cor': "#FF7D04",
        'descricao': "Pendente",
      },
      2: {
        'icone': Icons.play_arrow,
        'cor': "#09B45A",
        'descricao': "Em execução",
      },
      3: {
        'icone': Icons.check_circle,
        'cor': "#357EED",
        'descricao': "Finalizado",
      },
      4: {
        'icone': Icons.warning,
        'cor': "#E9273C",
        'descricao': "Atrasado",
      }
    };

    return configuracoesStatus[statusId];
  }

  @override
  Widget build(BuildContext context) {
    int statusId = atividade.status!;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 32.0,
        maxHeight: 107.0,
      ),
      child: Row(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(
                bottom: 8,
                top: 8,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: hexToColor(_getConfigStatus(statusId)["cor"]),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    _getConfigStatus(statusId)["icone"],
                    size: 16,
                    color: hexToColor("#ffffff"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      _getConfigStatus(statusId)["descricao"],
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        color: hexToColor("#ffffff"),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
