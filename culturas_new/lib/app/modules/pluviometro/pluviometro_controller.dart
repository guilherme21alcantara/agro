import 'dart:math';

import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/utils/alert.toast.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PluviometroController extends GetxController {
  final talhao = ''.obs;
  late DateTime dataTime;
  final milimetro = ''.obs;
  final tempMax = ''.obs;
  final temp = ''.obs;
  final obstxt = ''.obs;

  validation() {
    if (talhao.value.isEmpty || talhao.value == 'Selecione') {
      alertToast('erro', 'Talhão nao selecionado');
      return false;
      //} else if (dataTime.isBefore(DateTime.now())) {
      //  alertToast('erro', 'Data não pode ser menor que data atual');
      //   return false;
      //  } else if (dataTime == DateTime) {
      //   alertToast('erro', 'Formato de data invalido');
      //    return false;
    } else if (milimetro.value.isEmpty) {
      alertToast('erro', 'Campo Milimetro Vazio');
      return false;
    } else if (tempMax.value.isEmpty) {
      alertToast('erro', 'Campo Temperatura Maxima Vazio');
      return false;
    } else if (temp.value.isEmpty) {
      alertToast('erro', 'Campo temp Vazio');
      return false;
    }

    return true;
  }

  Future<bool> save() async {
    int id = 10000;
    if (validation()) {
      TablePluviametriaData data = TablePluviametriaData(
          id: Random().nextInt(id),
          createAt: DateTime.now(),
          dateColeta: DateTime.now(),
          milimetro: milimetro.value,
          tempMaxima: tempMax.value,
          temp: temp.value,
          obs: obstxt.value,
          talhao: talhao.value,
          status: 0,
          updateAt: DateTime.now());

      await MyDataBase.instance.pluviametriaDAO.addpluviametria(data);
      return true;
    } else {
      return false;
    }
  }

//mostrar um dialog na tela para salvamento dos Dados
  Future showMessage(BuildContext context) {
    return Get.defaultDialog(
      backgroundColor: primaryColor,
      titleStyle: TITULO_HEADER_STYLE,
      title: 'Confirme para salva seus dados',
      content: Column(
        children: const [
          const Icon(
            Icons.check_circle_outline,
            size: 77,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Após a confirmação dos dados não poderão ser alterados',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white)),
        ],
      ),
      actions: [
        MaterialButton(
            shape: const StadiumBorder(),
            color: secondaryColor,
            onPressed: () async {
              try {
                if (await save()) {
                  alertToast(
                      'sucess', 'Salvamento realizado com sucesso informaçães');
                  if (Get.isDialogOpen != null) {
                    Get.back();
                    Navigator.pop(context);
                  }
                }
              } catch (e) {
                alertToast('erro', 'ao salvar informaçães');
              }
            },
            child: const Text(
              'Confirmar informações',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
