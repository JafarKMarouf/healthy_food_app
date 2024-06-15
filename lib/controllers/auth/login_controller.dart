import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';

abstract class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  void login();

  void goToSignup();
  void goToResetPassword();
  bool validate();

  void rememberMe();
}

class LoginControllerImp extends LoginController {
  final RxBool visible = true.obs;
  final RxBool isRememberMe = false.obs;
  final GetStorage rememberStorage = GetStorage();
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    isRememberMe.value = rememberStorage.read('rememberMe') ?? false;
    super.onInit();
  }

  @override
  void goToSignup() {
    Get.offNamed(AppRoutesPage.signup);
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
  void login() {
    if (rememberStorage.read('rememberMe')) {
      rememberStorage.write('email_user', emailController.value.text);
      rememberStorage.write('mobile_user', mobileController.value.text);
      rememberStorage.write('password_user', passwordController.value.text);
    }
    log('=====================Signed In Sucessfully=====================');
  }

  @override
  void rememberMe() {
    isRememberMe.value = !isRememberMe.value;
    rememberStorage.write('rememberMe', isRememberMe.value);
  }
}
