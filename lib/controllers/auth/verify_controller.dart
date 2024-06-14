import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';

import '../../views/widgets/auth/success_bottom_sheet.dart';

abstract class VerifyController extends GetxController {
  void verify();

  void resend();

  bool validate();

  void showBSheet();

  void showWarning();
}

class VerifyControllerImp extends VerifyController {
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;

  @override
  void resend() {}

  @override
  void verify() {}

  @override
  bool validate() {
    if (formKey.value.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void showBSheet() {
    Get.bottomSheet(
      const SuccessBSheet(),
      enterBottomSheetDuration: AppDuration.btmSheetDuration,
      exitBottomSheetDuration: AppDuration.btmSheetDuration,
      enableDrag: true,
      isDismissible: false,
      barrierColor: Colors.black.withOpacity(.48),
    );
  }

  @override
  void showWarning() {
    Get.toNamed(AppRoutesPage.warning);
  }
}
