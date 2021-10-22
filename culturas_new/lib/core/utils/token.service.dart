import 'package:get_storage/get_storage.dart';

Map<String, String>? getHeaders() {
  var box = GetStorage();
  var jwt =  box.read("jwt");

  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $jwt',
  };

  return headers;
}
