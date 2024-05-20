// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/constants.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/auth/view/verification_view.dart';

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
    Get.offAll(
      () => const LoginView(),
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
  void goToVerify() {
    Get.to(
      () => const VerificationView(),
      duration: kDuration,
      transition: kTransition,
    );
  }

  @override
  void signup() {
    print('=====================Signed Up Sucessfully=====================');
  }

  @override
  void uploadImage() {
    print('=====================Upload Image=====================');
  }

  @override
  void uploadCertificate() {
    print('=====================upload Certificate=====================');
  }
}
