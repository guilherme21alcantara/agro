//@dart=2.9
import 'package:culturas_new/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(AppWidget());
}
