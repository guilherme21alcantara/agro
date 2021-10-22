import 'package:get/get.dart';

import 'monitoramento_controller.dart';

class MonitoramentoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MonitoramentoController>(() => MonitoramentoController());
  }
}
