import 'package:flutter/material.dart';

class TextAbastecimento extends StatelessWidget {
  final double width;
  final String title;

  const TextAbastecimento({required this.title, required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      child: Container(
        width:
            MediaQuery.of(context).size.width / 1.05, //Depois tira isso daqui
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(left: 10),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: title,
                  hintStyle: const TextStyle(),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ],
        ),
      ),
    );
  }
}
