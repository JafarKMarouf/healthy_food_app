import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/functions/check_connection.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';

import '../../core/utils/app_storage.dart';

abstract class LogoutController extends GetxController {
  void logout();
  void goToLogin();
}

class LogoutControllerImpl extends LogoutController {
  final RxBool loading = false.obs;
  late RxBool isConn = false.obs;
  final AuthRepoImpl authRepoImpl;

  LogoutControllerImpl({required this.authRepoImpl}) : super();

  @override
  void onInit() {
    checkConn();
    super.onInit();
  }

  checkConn() async {
    isConn.value = await checkConnection();
  }

  @override
  void goToLogin() {
    Future.delayed(
      AppDuration.transitionDuration,
      () => Get.offAllNamed(AppRoutesPage.login),
    );
  }

  @override
  void logout() async {
    var result = await authRepoImpl.logoutImp();
    result.fold((l) {
      Get.snackbar('failed', l['message']);
    }, (r) async {
      await AppStorage.removeToken();
      Get.snackbar('success', r['message']);
    });
  }
}
