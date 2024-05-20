import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/constants.dart';
import 'package:healthyfood/features/auth/view/warning_view.dart';

import '../view/widgets/success_bottom_sheet.dart';

abstract class VerifyController extends GetxController {
  void verify();

  void resend();

  bool validate();

  void showBSheet();

  void showWarning();
}

class VerifyControllerImp extends VerifyController {
  GlobalKey<FormState> formKey = GlobalKey();
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;
  @override
  void resend() {
  }

  @override
  void verify() {
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
  void showBSheet() {

    Get.bottomSheet(
      const SuccessBSheet(),
      enterBottomSheetDuration: kDuration,
      exitBottomSheetDuration: kDuration,
      enableDrag: true,
      isDismissible: false,
      barrierColor: Colors.black.withOpacity(.48),
    );
  }

  @override
  void showWarning() {
    Get.to(
      () => const WarningView(),
    );
  }
}
