import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/functions/show_dialog.dart';
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
  final AuthRepoImpl authRepoImpl;
  LoginControllerImp({required this.authRepoImpl}) : super();

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
  Future<void> login({
    required String email,
    required String mobile,
    required String password,
  }) async {
    var result = await authRepoImpl.loginImpl(
      email: email,
      mobile: mobile,
      password: password,
    );

    result.fold((l) {
      if (l.statusCode == 401) {
        Get.defaultDialog(content: CustomeFails(message: l.data['message']));
      } else if (l.statusCode == 422) {
        Get.defaultDialog(content: CustomeFails(message: l.data['errors']));
      }
      // log('=========left:${l['errors']}==========');
    }, (r) {
      Get.snackbar('success', r['access_token']);

      // log('======right:$r==========');
    });
    // if (rememberStorage.read('rememberMe')) {
    //   rememberStorage.write('email_user', emailController.value.text);
    //   rememberStorage.write('mobile_user', mobileController.value.text);
    //   rememberStorage.write('password_user', passwordController.value.text);
    // }
    log('=====================Signed In Sucessfully=====================');
  }

  @override
  void rememberMe() {
    isRememberMe.value = !isRememberMe.value;
    rememberStorage.write('rememberMe', isRememberMe.value);
  }
}
