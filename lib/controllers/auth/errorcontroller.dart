// ignore_for_file: avoid_print

import 'package:get/get.dart';

abstract class WarningController extends GetxController {
  void tryAgain();
}

class WarningControllerImpl extends WarningController {
  @override
  void tryAgain() {
    print('=====back to verifiction==');
    Get.back();
  }
}
