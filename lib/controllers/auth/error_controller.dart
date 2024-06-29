import 'package:get/get.dart';

abstract class WarningController extends GetxController {
  void tryAgain();
}

class WarningControllerImpl extends WarningController {
  @override
  void tryAgain() {
    Get.back();
  }
}
