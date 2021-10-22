import 'package:get_storage/get_storage.dart';

getCamera() {
  var box = GetStorage();
  var camera = box.read("camera");

  return camera;
}

setCamera(bool value) {
  var box = GetStorage();
  box.write('camera', value);
}

getLocalization() {
  var box = GetStorage();
  var localizacao = box.read("localizacao");

  return localizacao;
}

setLocalization(bool value) {
  var box = GetStorage();
  box.write('localizacao', value);
}
