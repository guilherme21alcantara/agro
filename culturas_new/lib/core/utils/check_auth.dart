import 'package:culturas_new/routes/pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class CheckAuth {
  static checkLogin() async {
    try {
      var box = GetStorage();
      var jwt = await box.read("jwt");
      if (jwt == null) {
        Get.offAllNamed(Routes.LOGIN);
      }
    } catch (e) {
      throw 'Algo deu errado na leitura do JWT';
    }
  }
}
