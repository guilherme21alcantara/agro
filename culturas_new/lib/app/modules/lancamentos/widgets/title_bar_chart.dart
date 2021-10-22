import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class TitleBarChart extends StatelessWidget {
  final String title;

  const TitleBarChart({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      color: COLORGREYCHART,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ))),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                LineIcons.tint,
                color: COLORBLUE,
              ),
              Text(
                '15 dias',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: COLORGREYCHART),
              )
            ],
          ),
        ))
      ],
    );
  }
}
