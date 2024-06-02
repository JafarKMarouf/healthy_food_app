import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignupController extends GetxController {
  void signup();

  void goToLogin();

  void goToVerify();

  bool validate();

  void uploadImage();

  void uploadCertificate();
}

class SignupControllerImp extends SignupController {
  RxBool visible1 = true.obs;
  RxBool visible2 = true.obs;
  GlobalKey<FormState> formKey = GlobalKey();
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;

  @override
  void goToLogin() {
    Get.offNamed('login');
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
  void goToVerify() {
    Get.toNamed('verify');
  }

  @override
  void signup() {
    log('=====================Signed Up Sucessfully=====================');
  }

  @override
  void uploadImage() {
    log('=====================Upload Image=====================');
  }

  @override
  void uploadCertificate() {
    log('=====================upload Certificate=====================');
  }
}
