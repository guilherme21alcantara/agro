import 'package:culturas_new/core/values/colors.dart';
import 'package:culturas_new/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
        fontFamily: 'Ubuntu',
        primaryColor: primaryColor,
        scaffoldBackgroundColor: colorBranco,
      ),
      // home: Mapa(),
      initialRoute: Routes.LOGIN,
      getPages: AppPages.pages,
    );
  }
}
