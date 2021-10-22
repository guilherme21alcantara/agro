import 'package:culturas_new/app/data/providers/api.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ConsolidacaoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsolidacaoController>(
        () => ConsolidacaoController(repository: MyApi()));
  }
}
