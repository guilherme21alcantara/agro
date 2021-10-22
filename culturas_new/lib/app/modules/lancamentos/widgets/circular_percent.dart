import 'dart:ffi';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/modules/lancamentos/controller_lancamentos.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';

class CircularPercent extends GetView<ControllerLancamentos> {
  @override
  Widget build(BuildContext context) {
    Get.put(ControllerLancamentos()); //inicializar controler.

    return Card(
      elevation: 5,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: StreamBuilder<List<TablePluviametriaData>>(
          stream: controller.listaPluviometria,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data!.isNotEmpty) {
                List<List<TablePluviametriaData>> dadosPorTalhao =
                    controller.filtarPorTalhao(snapshot.data!);
                return BarChartPages(
                  dadosPorTalhao: dadosPorTalhao,
                  controller: controller,
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      size: 60,
                    ),
                    Text(
                      "Dados Inexistentes!",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                );
              }
            }
          }),
    );
  }
}

class BarChartPages extends StatefulWidget {
  const BarChartPages({
    Key? key,
    required this.dadosPorTalhao,
    required this.controller,
  }) : super(key: key);
  final List<List<TablePluviametriaData>> dadosPorTalhao;
  final ControllerLancamentos controller;

  @override
  _BarChartPagesState createState() => _BarChartPagesState();
}

class _BarChartPagesState extends State<BarChartPages> {
  int indexPage = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double atrasado = 1256.23;
    double executado = 3460.33;
    double peratrasado = (atrasado * 100) / (atrasado + executado);
    double perexecutado = (executado * 100) / (atrasado + executado);
    Map<String, double> data = {
      'Executado': executado,
      'Atrasado': atrasado,
    };
    List<Color> colorlist = [Colors.green, Colors.yellow.shade300];

    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 250),
            child: const Text(
              STRING_EXECUTADO_INDICADORES,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 208,
          child: PageView(
            children: [
              for (List<TablePluviametriaData> plantioData
                  in widget.dadosPorTalhao)
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 295, top: 5),
                        child: Text(
                          plantioData[0].talhao,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        )),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                          left: 5,
                        )),
                        PieChart(
                          dataMap: data,
                          animationDuration: Duration(milliseconds: 800),
                          colorList: colorlist,
                          chartRadius: MediaQuery.of(context).size.width / 2.7,
                          initialAngleInDegree: 0,
                          chartType: ChartType.disc,
                          legendOptions: LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.right,
                            legendShape: BoxShape.rectangle,
                            showLegends: false,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartValuesOptions: ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: false,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: true,
                            decimalPlaces: 2,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 20, bottom: 5, top: 5),
                                width: 75,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.yellow.shade100,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    peratrasado.toStringAsPrecision(4) + '%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 20, bottom: 70),
                                width: 75,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    perexecutado.toStringAsPrecision(4) + '%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 6, bottom: 5, right: 2, top: 5),
                              child: Text(
                                'ATRASADO',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                left: 5,
                                bottom: 5,
                              ),
                              child: Text(
                                '$atrasado' + ' ha',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 6, bottom: 5, top: 9, right: 3),
                              child: Text(
                                'EXECUTADO',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 5, bottom: 74, top: 2),
                              child: Text(
                                '$executado' + ' ha',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
