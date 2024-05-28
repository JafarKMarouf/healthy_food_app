import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/shared/custome_text.dart';
import 'package:healthyfood/controllers/auth/signupcontroller.dart';

class RowSignup extends StatelessWidget {
  const RowSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp signupController = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomeText(
          text: 'Already have an account ? ',
          fontFamily: 'Cabin Medium',
          color: AppColors.fontColor,
          fontSize: 14,
        ),
        InkWell(
          onTap: () {
            signupController.goToLogin();
          },
          child: const CustomeText(
            text: 'Log in',
            fontFamily: 'Cabin Medium',
            fontSize: 14,
            color: Color(0xff25A340),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
