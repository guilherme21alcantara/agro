import 'package:culturas_new/app/modules/indicadores/indicadores_controller.dart';
import 'package:get/get.dart';

class IndicadoresBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IndicadoresController>(() => IndicadoresController());
  }
}
