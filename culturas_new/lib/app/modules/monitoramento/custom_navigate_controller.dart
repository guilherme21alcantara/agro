import 'package:culturas_new/routes/pages.dart';
import 'package:get/get.dart';

class NavigateController extends GetxController {
  final paginaAtual = ''.obs;

  void changeScene(newIndex) {
    if (newIndex == 0) {
      Get.toNamed(Routes.PLANTA);
      return;
    }

    if (newIndex == 1) {
      Get.toNamed(Routes.SOLO);
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
