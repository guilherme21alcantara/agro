import 'package:culturas_new/app/modules/pluviometro/pluviometro_controller.dart';
import 'package:get/get.dart';

class PluviometroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PluviometroController>(() => PluviometroController());
  }
}
