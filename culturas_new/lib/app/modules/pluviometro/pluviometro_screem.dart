import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:culturas_new/app/modules/pluviometro/pluviometro_controller.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'widgets/textfild_custon_pluviometro.dart';
import 'widgets/textfild_pluviomentro_nothin_text.dart';

//Create of Carlos Screem Pluviomentos

class PluviometroScreem extends GetView<PluviometroController> {
  @override
  Widget build(BuildContext context) {
    var _sizer = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          brightness: Brightness.dark,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text(
            STRING_TITLE_PLUVIOMETRIA,
            style: TITULO_HEADER_STYLE,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        AwesomeDropDown(
                          dropDownTopBorderRadius: 0,
                          dropDownBorderRadius: 0,
                          dropDownBottomBorderRadius: 6,
                          dropDownList: testeMocado,
                          dropDownIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                            size: 23,
                          ),
                          selectedItem: testeMocado.first,
                          onDropDownItemClick: (selectedItem) {
                            controller.talhao.value = selectedItem;
                          },
                          dropStateChanged: (isOpened) {
                            if (!isOpened) {}
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextfildPluviomentroNothinText(
                          title: '* Data da Coleta',
                          width: _sizer.width / 1.2,
                          formart: [
                            FilteringTextInputFormatter.digitsOnly,
                            DataInputFormatter(),
                          ],
                          readOnly: true,
                          innerText: Jiffy().format("dd/MM/yyyy"),
                          onChange: (value) {
                            try {
                              var temp = Jiffy(value, "dd/MM/yyyy").format();
                              var tem2 = DateTime.tryParse(temp);
                              controller.dataTime = tem2!;
                              // ignore: empty_catches
                            } catch (e) {} //TODO ALTERA E MEXER NA DATA
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              TextFildCustonPluviomento(
                                formart: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                title: 'Milimetros',
                                him: 'mm',
                                max: 4,
                                onChange: (value) {
                                  controller.milimetro.value = value;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFildCustonPluviomento(
                                formart: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                title: 'Temp. Máxima',
                                him: 'ºC',
                                max: 2,
                                onChange: (value) {
                                  controller.tempMax.value = value;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFildCustonPluviomento(
                                formart: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                him: 'ºC',
                                max: 2,
                                title: 'Temp. Minima ',
                                onChange: (value) {
                                  controller.temp.value = value;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextfildPluviomentroNothinText(
                                formart: const [],
                                title: 'Observações',
                                width: _sizer.width / 1.2,
                                onChange: (value) {
                                  controller.obstxt.value = value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ], // <3
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    child: const Text(
                      'Salvar',
                      style: TextStyle(fontSize: 21),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      primary: primaryColor,
                    ),
                    onPressed: () async {
                      controller.showMessage(context);
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

//somente para teste // isso tem que vim do banco de dados
var testeMocado = ['Selecione', 'Talhão 2', 'Talhão 3'];
