import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/functions/check_connection.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:healthyfood/views/widgets/auth/custome_fails.dart';

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
    loading.value = true;
    var result = await authRepoImpl.logoutImp();
    loading.value = false;
    result.fold((l) {
      Get.dialog(
        barrierColor: const Color(0xffFFFDFD),
        CustomeFails(message: l.errMessage),
      );
      Future.delayed(
        AppDuration.dialogDuration,
        () => Get.offAllNamed(AppRoutesPage.home),
      );
    }, (r) async {
      await AppStorage.removeToken();
      await AppStorage.removeImage();
      Get.snackbar('success', r['message']);
      goToLogin();
    });
  }
}
