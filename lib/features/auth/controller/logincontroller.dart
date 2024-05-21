// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/constants.dart';
import 'package:healthyfood/features/auth/view/signup_view.dart';

abstract class LoginController extends GetxController {
  void login();

  void goToSignup();

  bool validate();
}

class LoginControllerImp extends LoginController {
  RxBool visible = true.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  @override
  void goToSignup() {
    Get.offAll(
      () => const SignupView(),
      duration: kDuration,
      transition: kTransition,
    );
  }

  @override
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void login() {
    print('=====================Signed In Sucessfully=====================');
  }
}
