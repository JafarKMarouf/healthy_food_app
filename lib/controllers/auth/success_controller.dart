import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';

abstract class SuccessController extends GetxController {
  void goToLogout();
}

class SuccessControllerImpl extends SuccessController {
  @override
  void goToLogout() {
    Get.offAllNamed(AppRoutesPage.logout);
  }
}
