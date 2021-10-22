import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/app/modules/atividade/widgets/status.badge.dart';
import 'package:culturas_new/core/utils/convert_cores.dart';
import 'package:culturas_new/core/values/colors.dart';

import 'package:flutter/material.dart';

class AtividadeCardWidget extends StatelessWidget {
  final Atividade atividade;
  final Function() onTap;
  const AtividadeCardWidget({required this.atividade, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var edgeInsets = const EdgeInsets.only(bottom: 10);
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 191.0,
      ),
      child: Container(
        margin: edgeInsets,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: InkWell(
          onTap: onTap,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                    left: 15,
                    bottom: 5,
                  ),
                  child: StatusBadgeWidget(
                    atividade: atividade,
                  ),
                ),
                ListTile(
                  dense: true,
                  title: Text(
                    atividade.atividade ?? 'Atividade não definida',
                    style: const TextStyle(
                      fontSize: 21,
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
                      top: 0,
                    ),
                    child: Text(
                      atividade.area.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        color: hexToColor("#868B97"),
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    atividade.subArea.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 0,
                    left: 15,
                    bottom: 15,
                  ),
                  child: Text(
                    atividade.fazenda!.nome ?? '',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
