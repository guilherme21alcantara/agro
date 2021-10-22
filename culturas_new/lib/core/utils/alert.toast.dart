import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';


alertToast(tipo, msg) {
  var corFundo = Colors.green;

  if (tipo == 'erro') {
    corFundo = Colors.red;
  }

  showToast(
    msg,
    animation: StyledToastAnimation.scale,
    context: Get.overlayContext,
    backgroundColor: corFundo,
    position: StyledToastPosition.top,
    textStyle: const TextStyle(color: Colors.white, fontSize: 18.0),
  );
}
