import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  void login();

  void goToSignup();

  bool validate();
}

class LoginControllerImp extends LoginController {
  RxBool visible = true.obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void goToSignup() {
    Get.offNamed('signup');
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
    log('=====================Signed In Sucessfully=====================');
  }
}
