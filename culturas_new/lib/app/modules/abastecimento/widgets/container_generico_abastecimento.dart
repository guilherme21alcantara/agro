import 'package:culturas_new/core/theme/estilos.dart';
import 'package:flutter/material.dart';

class Containergeral extends StatelessWidget {
  final double width;
  final String title;
  final Function()? ontap;
  const Containergeral(
      {required this.title, required this.width, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
          child: Container(
        height: MediaQuery.of(context).size.width / 6,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 10),
        child: Row(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              padding: const EdgeInsets.only(right: 5, top: 5),
              child: const Icon(
                Icons.camera_alt,
                size: 50,
                color: Colors.grey,
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              padding: const EdgeInsets.only(top: 7),
              child: Text(title, style: ESTILOS_PERMISSOES),
            )
          ],
        ),
      )),
      onTap: ontap,
    );
  }
}
