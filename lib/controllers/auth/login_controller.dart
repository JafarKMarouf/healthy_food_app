import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/functions/check_connection.dart';
import 'package:healthyfood/core/functions/show_dialog.dart';
import 'package:healthyfood/core/utils/app_storage.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/custome_fails.dart';

abstract class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  void login({
    required String email,
    required String mobile,
    required String password,
  });

  void goToSignup();
  void goToVerify();
  void goToResetPassword();
  bool validate();
  void rememberMe();
}

class LoginControllerImp extends LoginController {
  final RxBool visible = true.obs;
  late RxBool isConn = false.obs;
  final RxBool isRememberMe = false.obs;
  final RxBool loading = false.obs;

  final GetStorage token = GetStorage();
  final GetStorage rememberStorage = GetStorage();
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepoImpl authRepoImpl;
  LoginControllerImp({required this.authRepoImpl}) : super();

  @override
  void onInit() {
    isRememberMe.value = rememberStorage.read('rememberMe') ?? false;
    checkConn();
    super.onInit();
  }

  checkConn() async {
    isConn.value = await checkConnection();
  }

  @override
  void goToSignup() {
    Get.offNamed(AppRoutesPage.signup);
  }

  @override
  void goToVerify() {
    Get.toNamed(AppRoutesPage.verify);
  }

  @override
  void goToResetPassword() {
    Get.toNamed(AppRoutesPage.forgetpassword);
  }

  @override
  bool validate() {
    if (formKey.value.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> login({
    required String email,
    required String mobile,
    required String password,
  }) async {
    loading.value = true;
    var result = await authRepoImpl.loginImpl(
      email: email,
      mobile: mobile,
      password: password,
    );

    result.fold((l) {
      loading.value = false;

      Get.dialog(
        barrierColor: const Color(0xffFFFDFD),
        CustomeFails(message: l.errMessage),
      );

      if (l.errMessage == '401 Invalid credentials') {
        Future.delayed(
          AppDuration.dialogDuration,
          () {
            Get.back();
            goToVerify();
          },
        );
      } else {
        Future.delayed(
          AppDuration.dialogDuration,
          () => Get.back(),
        );
      }
    }, (r) async {
      await AppStorage.storeToken(r['access_token']);
      Get.snackbar('success', 'Login Successfully!');
      Get.offAllNamed(AppRoutesPage.home);
    });
    if (rememberStorage.read('rememberMe')) {
      rememberStorage.write('email_user', emailController.value.text);
      rememberStorage.write('mobile_user', mobileController.value.text);
      rememberStorage.write('password_user', passwordController.value.text);
    }
  }

  @override
  void rememberMe() {
    isRememberMe.value = !isRememberMe.value;
    rememberStorage.write('rememberMe', isRememberMe.value);
  }
}
