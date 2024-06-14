import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customeShowDialog(
  BuildContext context,
  Widget widget, {
  Duration? duration,
}) {
  showDialog(
    barrierColor: duration == null
        ? Colors.black.withOpacity(.95).withAlpha(200)
        : Colors.white.withOpacity(.7),
    barrierDismissible: duration == null ? true : false,
    context: context,
    builder: (context) {
      if (duration != null) {
        Future.delayed(
          duration,
          () {
            if (Navigator.of(context).canPop()) {
              Get.back();
            }
          },
        );
      }
      return Dialog(
        
        surfaceTintColor: Colors.black,
        elevation: .3,
        child: widget,
      );
    },
  );
}
