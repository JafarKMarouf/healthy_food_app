import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customeShowDialog(
  BuildContext context,
  Duration duration,
  Widget widget,
) {
  showDialog(
    barrierColor: Colors.white.withOpacity(.7),
    barrierDismissible: false,
    context: context,
    builder: (context) {
      Future.delayed(
        duration,
        () {
          if (Navigator.of(context).canPop()) {
            Get.back();
          }
        },
      );
      return Dialog(
        child: widget,
      );
    },
  );
}
