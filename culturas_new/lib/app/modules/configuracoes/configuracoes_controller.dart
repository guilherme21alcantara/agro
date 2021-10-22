import 'package:culturas_new/core/utils/check_permitions.dart';
import 'package:culturas_new/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfiguracoesController extends GetxController {
  final isActiveLocalization = false.obs;
  final isActiveCamera = false.obs;

  logout() async {
    var box = GetStorage();
    await box.remove("jwt").whenComplete(() {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

//verifica se tem permisao da localizacão

  checkPermitions() {
    if (getCamera() != null) {
      isActiveCamera.value = getCamera();
    }

    if (getLocalization() != null) {
      isActiveLocalization.value = getLocalization();
    }
  }

  @override
  void onInit() {
    checkPermitions();
    super.onInit();
  }
}
