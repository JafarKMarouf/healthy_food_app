import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/verify_controller.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/functions/validator.dart';
import 'package:pinput/pinput.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyControllerImp verifyController = Get.find<VerifyControllerImp>();

    return Form(
      key: verifyController.formKey.value,
      autovalidateMode: verifyController.autoValidate.value,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Pinput(
          controller: verifyController.otpCodeController,
          length: 6,
          closeKeyboardWhenCompleted: true,
          keyboardType: TextInputType.text,
          pinAnimationType: PinAnimationType.fade,
          animationCurve: accelerateEasing,
          animationDuration: AppDuration.otpDuration,
          defaultPinTheme: PinTheme(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 7,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColors),
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 22,
              color: AppColors.fontColor,
            ),
          ),
          validator: (value) {
            return validate(value: value!, type: 'otp code', min: 6, max: 6);
          },
          onCompleted: (value) async {
            if (verifyController.validate()) {
              await verifyController.verify(otp: value);
              verifyController.otpCodeController.clear();
            } else {
              verifyController.autoValidate.value = AutovalidateMode.always;
            }
          },
          onSubmitted: (value) async {
            if (verifyController.validate()) {
              await verifyController.verify(otp: value);
              verifyController.otpCodeController.clear();
            } else {
              verifyController.autoValidate.value = AutovalidateMode.always;
            }
          },
        ),
      ),
    );
  }
}
