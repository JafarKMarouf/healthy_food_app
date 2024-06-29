import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/functions/check_connection.dart';
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
  late RxBool isRememberMe = false.obs;
  final RxBool loading = false.obs;

  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRepoImpl authRepoImpl;
  LoginControllerImp({required this.authRepoImpl}) : super();

  @override
  void onInit() async {
    var remember = await AppStorage.isRemembered();
    var cred = await AppStorage.getEmailRemeber();
    if (remember == true && cred != null) {
      isRememberMe.value = true;
    }
    isConn.value = await checkConnection();

    if (isRememberMe.value) {
      emailController.text = await AppStorage.getEmailRemeber() ?? '';
      mobileController.text = await AppStorage.getMobileRemeber() ?? '';
      passwordController.text = await AppStorage.getPassRemeber() ?? '';
    }

    super.onInit();
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

    result.fold((l) async {
      loading.value = false;

      Get.dialog(
        barrierColor: const Color(0xffFFFDFD),
        CustomeFails(message: l.errMessage),
      );

      if (l.errMessage == '401 Invalid credentials') {
        await AppStorage.removeVerify();
        if (isRememberMe.value) {
          await AppStorage.storeEmail(emailController.value.text);
          await AppStorage.storeMobile(mobileController.value.text);
          await AppStorage.storePass(passwordController.value.text);
        } else {
          await AppStorage.removeRemeberedCred();
        }

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
      await AppStorage.storeVerifedEmail(true);
      if (isRememberMe.value) {
        await AppStorage.storeEmail(emailController.value.text);
        await AppStorage.storeMobile(mobileController.value.text);
        await AppStorage.storePass(passwordController.value.text);
      } else {
        await AppStorage.removeRemeberedCred();
      }
      Get.snackbar('success', 'Login Successfully!');
      Get.offAllNamed(AppRoutesPage.home);

      var email = await AppStorage.getEmailRemeber();
      var mobile = await AppStorage.getMobileRemeber();
      var pass = await AppStorage.getPassRemeber();
      log('=============email remeber:$email============');
      log('=============pass remeber:$pass============');
      log('=============mobile remeber:$mobile============');
    });
  }

  @override
  Future<void> rememberMe() async {
    // log('====remember before${isRememberMe.value}====');
    isRememberMe.value = !isRememberMe.value;
    // log('====remember after${isRememberMe.value}====');
    await AppStorage.rememeberMe(isRememberMe.value);
    // var result = await AppStorage.isRemembered();
    // log('========reult:$result=======');
  }
}
