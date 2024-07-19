import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';

abstract class SuccessController extends GetxController {
  void goToHome();
}

class SuccessControllerImpl extends SuccessController {
  @override
  void goToHome() {
    Get.offAllNamed(AppRoutesPage.home);
  }
}
