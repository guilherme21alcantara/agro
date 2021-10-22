import 'package:culturas_new/app/data/providers/api.dart';
import '/app/modules/atividade/atividade_controller.dart';
import 'package:get/get.dart';
import 'atividade_repository.dart';

class AtividadeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AtividadeController>(
        () => AtividadeController(repository: AtividadeRepository(MyApi())),
        fenix: true);
  }
}
