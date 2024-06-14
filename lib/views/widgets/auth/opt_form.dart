import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/verify_controller.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyControllerImp verifyController = Get.put(VerifyControllerImp());

    return Form(
      key: verifyController.formKey.value,
      autovalidateMode: verifyController.autoValidate.value,
      child: OtpTextField(
        focusedBorderColor: const Color(0xff757575),
        numberOfFields: 6,
        fieldWidth: MediaQuery.of(context).size.width / 8,
        fieldHeight: MediaQuery.of(context).size.width / 7,
        borderRadius: BorderRadius.circular(50),
        showFieldAsBox: true,
        borderWidth: 2,
        cursorColor: AppColors.buttonsColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Color(0xff757575),
        ),
        keyboardType: TextInputType.text,
        onSubmit: (otp) {
          if (!verifyController.validate() || otp.length < 6) {
            verifyController.autoValidate.value = AutovalidateMode.always;
          } else {
            verifyController.verify();
            verifyController.showBSheet();
          }
        },
      ),
    );
  }
}
