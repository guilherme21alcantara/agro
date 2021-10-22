import 'package:culturas_new/routes/pages.dart';
import 'package:get_storage/get_storage.dart';

import '/app/modules/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepositoty repository;
  AuthController({required this.repository});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  final isloading = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//isso nao era pra esta aqui #TODO criar um repository para isso...segue! vamos em frente
  onSubmit() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    repository.api.login(
        sendDate: isloading,
        login: loginController.text,
        senha: senhaController.text);
  }

  checkLogin() async {
    try {
      var box = GetStorage();
      var jwt = await box.read("jwt");
      if (jwt != null) {
        Get.offAllNamed(Routes.ATIVIDADES);
      }
    } catch (e) {
      throw 'PRIMEIRA ACESSO';
    }
  }

  @override
  void onInit() {
    loginController.text = 'daniel.caixeta'; // admin
    senhaController.text = 'dc2021'; // 'dc2021'
    checkLogin();
    super.onInit();
  }

  @override
  void onClose() {
    loginController.dispose();
    senhaController.dispose();
    super.onClose();
  }
}
