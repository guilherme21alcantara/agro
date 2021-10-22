import 'package:culturas_new/app/modules/consolidacao/controller.dart';
import 'package:culturas_new/core/utils/convert_cores.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StatusBadgeConsolidavao extends GetView<ConsolidacaoController> {
  final status;

  const StatusBadgeConsolidavao({required this.status});

  @override
  Widget build(BuildContext context) {
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
                color: hexToColor(controller.getConfigStatus(status)["cor"]),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    controller.getConfigStatus(status)["icone"],
                    size: 16,
                    color: hexToColor("#ffffff"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: Text(
                      controller.getConfigStatus(status)["descricao"],
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
