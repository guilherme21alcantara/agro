import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerGeneric extends StatelessWidget {
  final double width;
  final String title;
  final TextEditingController controller;

  const ContainerGeneric({required this.title, required this.width, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.width / 3.5,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLength: 6,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: title,
                hintStyle: const TextStyle(),
              ),
              inputFormatters: [
                RealInputFormatter(),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
