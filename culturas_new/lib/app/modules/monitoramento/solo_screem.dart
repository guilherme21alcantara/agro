import 'package:culturas_new/app/data/models/talhao.dart';
import 'package:culturas_new/app/modules/monitoramento/custom_navigate.dart';
import 'package:culturas_new/app/modules/monitoramento/monitoramento_controller.dart';
import 'package:culturas_new/app/modules/monitoramento/widgets/mapa_monitoramento.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// ignore: camel_case_types
class soloMonitoramentoScreem extends StatefulWidget {
  soloMonitoramentoScreem({Key? key}) : super(key: key);

  @override
  _soloMonitoramentoScreemState createState() =>
      _soloMonitoramentoScreemState();
}

// ignore: camel_case_types
class _soloMonitoramentoScreemState extends State<soloMonitoramentoScreem> {
  MonitoramentoController monitoramentoController =
      Get.put<MonitoramentoController>(MonitoramentoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomNavigation(paginaAtual: SOLO),
        appBar: AppBar(
            backgroundColor: primaryColor, title: Text("Selecione o Talhao")),
        body: FutureBuilder<List<Talhao>>(
            future: monitoramentoController.carregarListaTalhoes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(
                          right: 17,
                          left: 17,
                          top: 15,
                        ),
                        child: ListTile(
                            leading: Icon(MdiIcons.grass),
                            title: Text(snapshot.data![i].nome!),
                            trailing: ElevatedButton(
                                onPressed: () {
                                  Get.to(MapaMonitoramentoScreen(
                                      talhao: snapshot.data![i]));
                                },
                                child: Text("Monitorar"))),
                      );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
