import 'package:culturas_new/app/data/providers/api.dart';

import 'package:get/get.dart';

import 'controller.dart';

class AbastecimentoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AbastecimentoController>(
        () => AbastecimentoController(repository: MyApi()));
  }
}
