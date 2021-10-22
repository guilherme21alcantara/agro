import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GeneriCard extends Container {
  final String? title;
  final double right;
  final double left;

  GeneriCard({required this.title, required this.right, required this.left});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(
        right: right,
        left: left,
        top: 15,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Ubuntu',
                color: colorblueDarck,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
