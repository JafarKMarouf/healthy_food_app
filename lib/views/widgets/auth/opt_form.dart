// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/verifycontroller.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyControllerImp verify = Get.put(VerifyControllerImp());

    return Form(
      key: verify.formKey,
      autovalidateMode: verify.autoValidate.value,
      child: GetBuilder<VerifyControllerImp>(
        builder: (controller) => OtpTextField(
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
            if (!controller.validate() || otp.length < 6) {
              controller.autoValidate.value = AutovalidateMode.always;
              print('=======not validate========');
            } else {
              controller.verify();
              controller.showBSheet();
            }
          },
        ),
      ),
    );
  }
}
