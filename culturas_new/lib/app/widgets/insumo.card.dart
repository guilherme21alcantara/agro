import 'package:culturas_new/app/data/models/atividade.model.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';

class InsumoCardWidget extends StatefulWidget {
  final InsumoAtividade item;
  const InsumoCardWidget({required this.item});

  _InsumoCardState createState() => _InsumoCardState();
}

class _InsumoCardState extends State<InsumoCardWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    controller.text =
        "${widget.item.quantidade?.toStringAsFixed(2)} ${widget.item.unidade}";

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 110.0,
        minWidth: MediaQuery.of(context).size.width,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                widget.item.descricao.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: colorTeste,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: TextFormField(
                  controller: controller,
                  enabled: false,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
