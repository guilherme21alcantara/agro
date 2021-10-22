import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/material.dart';

class InforTitleBarChart extends StatelessWidget {
  final String whatIsAcummulation;
  final String accumnulation;

  const InforTitleBarChart(
      {required this.accumnulation, required this.whatIsAcummulation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Text(
                  whatIsAcummulation,
                  style: TextStyle(
                      color: COLORGREYCHART,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ))),
        Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text(
                  '$accumnulation mm',
                  style: TextStyle(
                      color: Colors.lightBlue[700],
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )))
      ],
    );
  }
}
