// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:healthyfood/core/constants/constants.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';

abstract class LogoutController extends GetxController {
  void logout();
  void goToLogin();
}

class LogoutControllerImpl extends LogoutController {
  @override
  void goToLogin() {
    Get.offAll(
      () => const LoginView(),
      transition: Transition.rightToLeft,
      duration: kDuration,
    );
  }

  @override
  void logout() {
    print('================Log out============');
  }
}
