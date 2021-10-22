import 'package:culturas_new/app/modules/configuracoes/configuracoes_controller.dart';
import 'package:get/get.dart';

class ConfiguracoesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfiguracoesController>(() => ConfiguracoesController());
  }
}
