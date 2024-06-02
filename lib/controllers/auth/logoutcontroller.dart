import 'dart:developer';

import 'package:get/get.dart';

abstract class LogoutController extends GetxController {
  void logout();
  void goToLogin();
}

class LogoutControllerImpl extends LogoutController {
  @override
  void goToLogin() {
    Get.offAllNamed('login');
  }

  @override
  void logout() {
    log('================Log out============');
  }
}
