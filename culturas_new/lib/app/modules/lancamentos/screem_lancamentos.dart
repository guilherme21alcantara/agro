import 'package:culturas_new/app/modules/lancamentos/widgets/bar_chart.dart';
import 'package:culturas_new/app/modules/lancamentos/widgets/circular_percent.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/material.dart';

class ScreemLancamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  STRING_PL_SEME_INDICADORES,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            CircularPercent(),
            const SizedBox(height: 5),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  STRING_PLUVIOMETRIA_INDICADORES,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 5),
            BarChartWidget()
          ],
        ));
  }
}
