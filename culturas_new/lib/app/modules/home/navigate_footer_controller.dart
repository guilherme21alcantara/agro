import 'package:culturas_new/routes/pages.dart';
import 'package:get/get.dart';

class NavigateFooterController extends GetxController {
  final paginaAtual = ''.obs;

  void changeScene(newIndex) {
    if (newIndex == 0 && paginaAtual.value != 'atividades') {
      Get.toNamed(Routes.ATIVIDADES);
      return;
    }

    if (newIndex == 1 && paginaAtual.value != 'Indicadores') {
      Get.toNamed(Routes.INDICADORES);
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
