import 'package:culturas_new/app/modules/configuracoes/widgets/genereic_btn_config.dart';
import 'package:culturas_new/routes/pages.dart';
import './widgets/switch_com_titulo.dart';
import '/core/theme/estilos.dart';
import '/core/values/colors.dart';
import '/core/values/string.dart';
import 'configuracoes_controller.dart';
//lib
import 'package:get/get.dart';
//lib
import 'package:flutter/material.dart';

class ConfiguracoesScreem extends GetView<ConfiguracoesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            brightness: Brightness.dark,
            centerTitle: true,
            title: const Text(
              TITLECONFIGURACOES,
              style: TITULO_HEADER_STYLE,
            ),
            leading: InkWell(
              onTap: () {
                Get.toNamed(Routes.ATIVIDADES);
              },
              child: Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                top: 25,
                left: 20,
                bottom: 25,
              ),
              child: Text(
                PERMISSOES,
                style: TextStyle(
                  color: colorblackLight,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 145,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SwitchComTitulo(
                    title: ACESSO_A_LOCALIZACAO,
                    active: controller.isActiveLocalization,
                  ),
                  const Divider(),
                  SwitchComTitulo(
                    title: ACESSO_A_CAMERA,
                    active: controller.isActiveCamera,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GenericBtnConfig(
                title: CONSOLIDACAO,
                onTap: () => Get.toNamed(Routes.CONSOLIDACAO),
                icon: const Icon(Icons.save)),
            const SizedBox(
              height: 10,
            ),
            GenericBtnConfig(
                title: SAIR_APP,
                onTap: controller.logout,
                icon: const Icon(Icons.exit_to_app_outlined)),
          ],
        ));
  }
}
