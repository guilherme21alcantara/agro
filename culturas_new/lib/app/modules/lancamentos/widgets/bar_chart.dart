import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller_lancamentos.dart';
import 'infor_title_bar_chart.dart';
import 'title_bar_chart.dart';

class BarChartWidget extends GetView<ControllerLancamentos> {
  @override
  Widget build(BuildContext context) {
    Get.put(ControllerLancamentos()); //inicializar controler.

    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 10,
        shape:
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                        size: 72,
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
      ),
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleBarChart(
          title: 'Fazenda Sama',
        ),
        Expanded(
          child: PageView(
              onPageChanged: (newPage) {
                setState(() {
                  indexPage = newPage;
                });
              },
              children: [
                for (List<TablePluviametriaData> pluviametriaData
                    in widget.dadosPorTalhao)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(pluviametriaData[0].talhao)),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => Flexible(
                            child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: BarChart(BarChartData(
                                    alignment: BarChartAlignment.spaceAround,
                                    barTouchData: BarTouchData(
                                        touchTooltipData: BarTouchTooltipData(
                                            tooltipBgColor: Colors.transparent,
                                            tooltipMargin: 0,
                                            getTooltipItem: (
                                              BarChartGroupData group,
                                              int groupIndex,
                                              BarChartRodData rod,
                                              int rodIndex,
                                            ) {
                                              return BarTooltipItem(
                                                  '', const TextStyle(),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: (rod.y - 2)
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: Colors.blue,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15))
                                                  ]);
                                            }),
                                        touchCallback: (barTouchResponse) {
                                          if (barTouchResponse.spot != null &&
                                              barTouchResponse.touchInput
                                                  is! PointerCancelEvent &&
                                              barTouchResponse.touchInput
                                                  is! PointerExitEvent) {
                                            //pega o indexe da barra
                                            widget.controller.touchedIndex
                                                    .value =
                                                barTouchResponse
                                                    .spot!.touchedBarGroupIndex;
                                          }
                                        }),
                                    titlesData: FlTitlesData(
                                      show: true, //title X ->
                                      bottomTitles: SideTitles(
                                        showTitles: true,
                                 
                                        margin: 0,
                                      ),
                                      leftTitles: SideTitles(showTitles: false),
                                    ),
                                    borderData: FlBorderData(
                                      show: false,
                                    ),
                                    barGroups: widget.controller.showinGroups(
                                        x: widget.controller
                                            .extrairMilimetroTalhao(widget
                                                .dadosPorTalhao[indexPage]),
                                        milimetroTalhao: widget.controller
                                            .extrairMilimetroTalhao(
                                                widget.dadosPorTalhao[
                                                    indexPage])))))),
                      ),
                      InforTitleBarChart(
                        whatIsAcummulation: 'Acumulado dos 15 dias',
                        accumnulation: widget.controller
                            .calcularMilimetragemQuizena(
                                widget.dadosPorTalhao[indexPage])
                            .toString(),
                      ),
                      InforTitleBarChart(
                        whatIsAcummulation: 'Acumulado na safra',
                        accumnulation: widget.controller
                            .calcularMilimetragemTotal(
                                widget.dadosPorTalhao[indexPage])
                            .toString(),
                      ),
                    ],
                  )
              ]),
        ),
      ],
    );
  }
}
