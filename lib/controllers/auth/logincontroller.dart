import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    Get.offNamed('signup');
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
    log('=====================Signed In Sucessfully=====================');
  }
}
