import 'package:get/get.dart';
import 'package:healthyfood/features/auth/view/logout_view.dart';

abstract class SuccessController extends GetxController {
  void goToLogout();
}

class SuccessControllerImpl extends SuccessController {
  @override
  void goToLogout() {
    Get.to(
      () => const LogoutView(),
    );
  }
}
