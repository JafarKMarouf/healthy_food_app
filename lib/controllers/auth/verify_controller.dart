import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/utils/app_storage.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/screens/warning_view.dart';

import '../../views/widgets/auth/success_bottom_sheet.dart';

abstract class VerifyController extends GetxController {
  Future<void> verify({required String otp});

  Future<void> resend();

  void validate();
  void showBSheet();

  void goToLogin();

  void goToHome();
}

class VerifyControllerImp extends VerifyController {
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;
  final AuthRepoImpl authRepoImpl;
  final RxBool loading = false.obs;
  final TextEditingController otpCodeController = TextEditingController();

  final RxInt timer = 120.obs;
  Timer? time;
  VerifyControllerImp({required this.authRepoImpl}) : super();

  @override
  void onInit() async {
    var token = await AppStorage.getToken();
    if (token == null) resend();
    super.onInit();
  }

  @override
  Future<void> verify({required String otp}) async {
    loading.value = true;
    var result = await authRepoImpl.confirmCodeImp(code: otp);
    loading.value = false;

    result.fold((l) {
      Get.dialog(
        barrierColor: const Color(0xffFFFDFD),
        WarningView(message: l.errMessage),
      );
    }, (r) async {
      await AppStorage.storeVerifedEmail(true);
      showBSheet();
    });
  }

  @override
  Future<void> resend() async {
    loading.value = true;
    var result = await authRepoImpl.resendCodeImp();
    loading.value = false;

    result.fold((l) {
      Get.dialog(
        barrierColor: const Color(0xffFFFDFD),
        WarningView(message: l.errMessage),
      );
    }, (r) {
      Get.snackbar('success', r['message']);
      startTimer();
    });
  }

  void startTimer() {
    timer.value = 120;

    const oneSec = Duration(seconds: 1);
    time = Timer.periodic(oneSec, (Timer time) {
      if (timer.value == 0) {
        time.cancel();
        // update();
      } else {
        timer.value--;
        // update();
      }
    });
  }

  @override
  void goToHome() {
    Get.offAllNamed(AppRoutesPage.home);
  }

  @override
  void goToLogin() {
    Get.offAllNamed(AppRoutesPage.login);
  }

  @override
  void showBSheet() {
    Get.bottomSheet(
      const SuccessBSheet(),
      enterBottomSheetDuration: AppDuration.btmSheetDuration,
      exitBottomSheetDuration: AppDuration.btmSheetDuration,
      enableDrag: false,
      isDismissible: false,
      barrierColor: Colors.black.withOpacity(.48),
    );
  }

  @override
  bool validate() {
    if (formKey.value.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
