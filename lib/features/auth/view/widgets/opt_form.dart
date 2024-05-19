import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:get/get.dart';
import 'package:healthyfood/features/auth/view/widgets/success_bottom_sheet.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autoValidate = AutovalidateMode.disabled;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: OtpTextField(
        focusedBorderColor: const Color(0xff757575),
        numberOfFields: 6,
        fieldWidth: MediaQuery.of(context).size.width / 8,
        fieldHeight: MediaQuery.of(context).size.width / 7,
        borderRadius: BorderRadius.circular(50),
        showFieldAsBox: true,
        borderWidth: 2,
        cursorColor: kButtonsColor,
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Color(0xff757575),
        ),
        keyboardType: TextInputType.text,
        onSubmit: (otp) {
          if (!formKey.currentState!.validate() || otp.length < 6) {
            // print('Must be verify otp code ');
            autoValidate = AutovalidateMode.always;
          } else {
            Get.bottomSheet(
              const SuccessBSheet(),
              enterBottomSheetDuration: kDurationTransition,
              exitBottomSheetDuration: kDurationTransition,
              enableDrag: false,
              isDismissible: false,
              barrierColor: Colors.black.withOpacity(.48),
            );
          }
        },
      ),
    );
  }
}
