import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';

abstract class SuccessController extends GetxController {
  void goToLogin();
}

class SuccessControllerImpl extends SuccessController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppRoutesPage.login);
  }

}
