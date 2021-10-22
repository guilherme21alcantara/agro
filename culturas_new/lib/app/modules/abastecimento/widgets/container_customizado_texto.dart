import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContainerAbast extends StatelessWidget {
  final double width;
  final String title;
  final int maxLenght;
  final TextEditingController controller;

  const ContainerAbast({required this.title, required this.width, required this.maxLenght, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.width / 3.5,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(
              padding: const EdgeInsets.only(top: 10),
            ),
            TextField(
              maxLength: maxLenght,
              controller: controller,
              decoration: InputDecoration(
                hintText: title,
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
