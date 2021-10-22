import 'package:flutter/material.dart';

class GenericFieldFinalizar extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController txtController;
  const GenericFieldFinalizar(
      {required this.hint, required this.label, required this.txtController});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      child: Container(
        width:
            MediaQuery.of(context).size.width / 1.05, //Depois tira isso daqui
        child: TextField(
          controller: txtController,
          decoration: InputDecoration(
              labelText: 'confirme o total de $hint $label',
              hintText: hint,
              hintStyle: const TextStyle(),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ),
    );
  }
}
