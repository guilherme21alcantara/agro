import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:culturas_new/app/data/db/my_database.dart';
import 'package:culturas_new/app/data/models/deposito.model.dart';
import 'package:culturas_new/app/data/models/maquina.model.dart';
import 'package:culturas_new/app/data/providers/api.dart';
import 'package:culturas_new/core/theme/estilos.dart';
import 'package:culturas_new/core/utils/alert.toast.dart';
import 'package:culturas_new/core/utils/check_permitions.dart';
import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/core/values/constantes.dart';
import 'package:culturas_new/core/values/string.dart';
import 'package:culturas_new/routes/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrscan/qrscan.dart';

class AbastecimentoController extends GetxController {
  final MyApi repository;

  AbastecimentoController({required this.repository});

  Rx<Deposito> deposito = Deposito().obs;
  Rx<Maquina> maquina = Maquina().obs;

  //FOTOS File
  Rx<File> fileimage1 = File('').obs;
  Rx<File> fileimage2 = File('').obs;
  final img1Coverted = ''.obs;
  final img2Coverted = ''.obs;
  final isImage1 = false.obs;
  final isImage2 = false.obs;

  TextEditingController controllerEditOdometro = TextEditingController();
  TextEditingController controllerEditOleo = TextEditingController();

  validation() {
    if (controllerEditOdometro.text.isEmpty ||
        controllerEditOleo.text.isEmpty) {
      alertToast('erro', 'campo nome Vazio');
      return false;
    }
    if (img1Coverted == File('').obs || img2Coverted == '') {
      alertToast('erro', 'Foto vazia');
      return false;
    }
    return true;
  }

//função da Cemera, Abre a Camera para TIRA FOTO DO  ODOMETRO E BOMBA
  Future camera(String whatfile) async {
    var imagePicker = ImagePicker();

    try {
      XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
      if (image?.path != null || image?.path != '') {
        File file = File(image!.path);
        //criar a conversao aqui !
        if (whatfile == FOTO_DA_BOMBA) {
          isImage1.value = true;
          fileimage1.value = file;
          try {
            List<int> fileInByte = file.readAsBytesSync();
            img1Coverted.value = base64Encode(fileInByte);
          } catch (e) {
            throw 'Erro ao converte Imagem na base64';
          }
        } else if (whatfile == FOTO_DO_ODOMETRO) {
          isImage2.value = true;
          fileimage2.value = file;

          try {
            List<int> fileInByte = file.readAsBytesSync();
            img2Coverted.value = base64Encode(fileInByte);
          } catch (e) {
            throw 'Erro ao converte Imagem2 na base64';
          }
        }
      }
    } catch (e) {
      throw 'ERRO AO CARREGR CAMEERA $e';
    }
  }

//Dialog Alert - para confirmação
  Future showMessage() {
    if (validation()) {
      return Get.defaultDialog(
        backgroundColor: primaryColor,
        titleStyle: TITULO_HEADER_STYLE,
        title: 'Concluido com sucesso',
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
            const Text('Ação realizada corretamente',
                style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          MaterialButton(
              shape: const StadiumBorder(),
              color: secondaryColor,
              onPressed: () {
                save().whenComplete(() => Get.offAllNamed(Routes.ATIVIDADES));
              },
              child: const Text(
                'Confirmar informações',
                style: TextStyle(color: Colors.white),
              ))
        ],
      );
    } else {
      throw 'Algum campo em branco! verifique';
    }
  }

//Ler QRCOD DEPOSITO
  Future lerQrCodeDeposito() async {
    String? qrcode = '81571325-6ce6-4543-a1c9-3c9b4f227e7f';
    // '81571325-6ce6-4543-a1c9-3c9b4f227e7f';
    // await scan();
    try {
      DepositoModel resposta = await repository.getRegistrosDeposito();
      for (var temp in resposta.depositos!) {
        if (temp.id!.toUpperCase() == qrcode.toUpperCase()) {
          deposito.value = temp;
          setCamera(true); //set permition in Option true
          return true;
        }
      }
      return false;
    } catch (e) {
      throw 'algo deu errado na leitura do QR Code';
    }
  }

//Ler QRCOD MAQUINAS
  Future lerQrCodeMaquina() async {
    String? qrcode = 'd610ded0-1e79-4e04-9a79-030084b8d1cc';
    //'d610ded0-1e79-4e04-9a79-030084b8d1cc';
    //await scan();
    try {
      MaquinaModel resposta = await repository.getRegistrosMaquinas();
      for (var temp in resposta.maquinas!) {
        if (temp.id!.toUpperCase() == qrcode.toUpperCase()) {
          maquina.value = temp;
          return true;
        }
      }
      return false;
    } catch (e) {
      throw 'algo deu errado na leitura do QR Code';
    }
  }

//Save DB
  Future<void> save() async {
    int id = 10000;

    TableAbastecimentoData data = TableAbastecimentoData(
        id: Random().nextInt(id),
        oleo: controllerEditOleo.text,
        fotoOleo: img1Coverted.value,
        odometro: controllerEditOdometro.text,
        fotoOdomentro: img2Coverted.value,
        status: CONSOLIDACAO_PENDENTE,
        idFazenda: deposito.value.id.toString(),
        nomeFazenda: deposito.value.nome.toString(),
        idMaquina: maquina.value.id.toString(),
        nomeMaquina: maquina.value.nome.toString(),
        createAt: DateTime.now(),
        updateAt: DateTime.now());

    await MyDataBase.instance.abastecimentoDAO.addAbastecimento(data);
  }

  @override
  void onInit() {
    //TODO somente para Debug
    //controllerEditOdometro.text = '111';
    //controllerEditOleo.text = '111';
    super.onInit();
  }
}
