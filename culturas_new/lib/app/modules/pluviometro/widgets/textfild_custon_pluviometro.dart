import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFildCustonPluviomento extends StatelessWidget {
  final String title;
  final String him;
  final int max;
  final List<TextInputFormatter> formart;
  final Function(String)? onChange;
  const TextFildCustonPluviomento(
      {required this.title,
      required this.onChange,
      required this.him,
      required this.max,
      required this.formart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: Text(
            title + ':',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
          Container(
            width: MediaQuery.of(context).size.width /
                2.5, //Depois tira isso daqui
            child: TextField(
              inputFormatters: formart,
              keyboardType: TextInputType.number,
              maxLength: max,
              onChanged: onChange,
              decoration: InputDecoration(
                  labelText: him,
                  hintText: him,
                  hintStyle: const TextStyle(),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
        ],
      ),
    );
  }
}
