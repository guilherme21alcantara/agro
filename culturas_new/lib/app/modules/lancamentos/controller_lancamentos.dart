import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerLancamentos extends GetxController {
  final touchedIndex = 0.obs;
  Stream<List<TablePluviametriaData>> listaPluviometria =
      MyDataBase.instance.pluviametriaDAO.listAll();

  List<int> dadosMokados = [10, 20, 13, 5, 1, 8, 6, 7, 9, 10, 8, 5, 3, 2, 7];
  List<double> dadosMokados2 = [
    10,
    20,
    13,
    5,
    1,
    8,
    6,
    7,
    9,
    10,
    8,
    5,
    3,
    2,
    7
  ];

//gera lista dinamica dos itens
  List<BarChartGroupData> showinGroups(
          {@required List<int>? x, required List<int> milimetroTalhao}) =>
      List.generate(15, (i) {
        switch (i) {
          case 0:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 1:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 2:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 3:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 4:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 5:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 6:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 7:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 8:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 9:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 10:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 11:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 12:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 13:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          case 14:
            return makeGroupDate(x![i], milimetroTalhao[i] + 1,
                isTouched: i == touchedIndex.value);
          default:
            return throw 'Erro na geracao de Lista';
        }
      });

//criacao das barras
  BarChartGroupData makeGroupDate(
    int x,
    double y, {
    bool isTouched = false,
    List<Color> barcolor = COLORBAR,
    double width = 10,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
              y: isTouched ? y + 1 : y,
              colors: isTouched ? COLORBAR : COLORBAR,
              width: width,
              backDrawRodData:
                  BackgroundBarChartRodData(show: true, y: y, colors: COLORBAR))
        ],
        showingTooltipIndicators: showTooltips);
  }

  // Separar os dados por cada talhao
  List<List<TablePluviametriaData>> filtarPorTalhao(
      List<TablePluviametriaData> data) {
    List<List<TablePluviametriaData>> dadosPorTalhao = [];
    data.forEach((element) {
      var teste = dadosPorTalhao
          .where((data) => data[0].talhao == element.talhao)
          .isNotEmpty;
      if (teste) {
        for (int i = 0; i < dadosPorTalhao.length; i++) {
          if (dadosPorTalhao[i][0].talhao == element.talhao) {
            dadosPorTalhao[i].add(element);
          }
        }
      } else {
        dadosPorTalhao.add([]);
        dadosPorTalhao[dadosPorTalhao.length - 1].add(element);
      }
    });

    for (List<TablePluviametriaData> dadosTalhao in dadosPorTalhao) {
      dadosTalhao.sort((a, b) => a.dateColeta.millisecondsSinceEpoch
          .compareTo(b.dateColeta.millisecondsSinceEpoch));
    }

    return dadosPorTalhao;
  }

  List<int> extrairMilimetroTalhao(List<TablePluviametriaData> dadosTalhao) {
    List<int> milimetroDia = [];

    if (dadosTalhao.length > 14) {
      for (int i = 0; i < 15; i++) {
        milimetroDia.add(int.parse(dadosTalhao[i].milimetro));
      }
    } else {
      for (TablePluviametriaData dado in dadosTalhao) {
        milimetroDia.add(int.parse(dado.milimetro));
      }
    }
    while (milimetroDia.length < 15) {
      milimetroDia.insert(0, 0);
    }

    return milimetroDia;
  }

  double calcularMilimetragemQuizena(List<TablePluviametriaData> dadosTalhao) {
    double milimetragemTotalQuizena = extrairMilimetroTalhao(dadosTalhao)
        .reduce((value, element) => value + element)
        .toDouble();

    return milimetragemTotalQuizena;
  }

  double calcularMilimetragemTotal(List<TablePluviametriaData> dadosTalhao) {
    double milimetragemTotal = 0;
    for (TablePluviametriaData dado in dadosTalhao) {
      milimetragemTotal += double.parse(dado.milimetro);
    }
    return milimetragemTotal;
  }
}
