import 'package:get/get.dart';

abstract class SuccessController extends GetxController {
  void goToLogout();
}

class SuccessControllerImpl extends SuccessController {
  @override
  void goToLogout() {
    Get.offAllNamed('login');
  }
}
