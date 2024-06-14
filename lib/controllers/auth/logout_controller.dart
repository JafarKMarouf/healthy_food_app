import 'dart:developer';

import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';

abstract class LogoutController extends GetxController {
  void logout();
  void goToLogin();
}

class LogoutControllerImpl extends LogoutController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppRoutesPage.login);
  }

  @override
  void logout() {
    log('================Log out============');
  }
}
