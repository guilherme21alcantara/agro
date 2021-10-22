import '/core/values/colors.dart';
import '/core/values/path_imagens.dart';
import '/core/values/string.dart';
import 'auth.controller.dart';

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    color: primaryColor!,
                    // decoration: const BoxDecoration(

                    //     // image: DecorationImage(
                    //     //   fit: BoxFit.cover,
                    //     //   image: AssetImage(BACKGROUND_LOGIN),
                    //     // ),
                    //     ),
                    child: const Center(
                      child: Image(
                        image: AssetImage(LOGO),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 210),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  width: 2,
                                  color: colorGrey,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: TextFormField(
                                controller: controller.loginController,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: const InputDecoration(
                                  labelText: LOGIN,
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return COMPO_OBRIGATORIO;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(
                                  width: 2,
                                  color: colorGrey,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: TextFormField(
                                controller: controller.senhaController,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: SENHA,
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return COMPO_OBRIGATORIO;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            //controller.enviarDados.value ?
                            const SizedBox(height: 15),
                            Obx(() => SizedBox(
                                  height: 78,
                                  width: double.infinity,
                                  child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: !controller.isloading.value
                                        ? controller.onSubmit
                                        : null,
                                    child: !controller.isloading.value
                                        ? const Text(
                                            ENTER,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                            ),
                                          )
                                        : const CircularProgressIndicator(),
                                    color: primaryColor,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
