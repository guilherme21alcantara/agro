import 'package:culturas_new/app/data/providers/api.dart';
import '/app/modules/auth/auth_repository.dart';

import '/app/modules/auth/auth.controller.dart';

import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
        () => AuthController(repository: AuthRepositoty(MyApi())));
  }
}
