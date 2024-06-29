import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/shared/custome_text.dart';
import 'package:healthyfood/controllers/auth/success_controller.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:get/get.dart';

class SuccessBSheet extends StatelessWidget {
  const SuccessBSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[
        Color(0xffB6E5B9),
        Color(0xff82A485),
        Color(0xff657F67),
      ],
    ).createShader(
      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
    );
    final success = Get.put(SuccessControllerImpl());

    return Container(
      padding: EdgeInsets.only(
        top: 8,
        right: MediaQuery.of(context).size.width / 8,
        left: MediaQuery.of(context).size.width / 8,
      ),
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: AppColors.fillFormColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(AppImages.close),
          const Spacer(flex: 1),
          Image.asset(AppImages.success),
          const Spacer(flex: 1),
          Text(
            'Success!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cabin',
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          const Spacer(flex: 1),
          const CustomeText(
            text: 'Congratulations! You have been successfully authenticated',
            fontSize: 18,
            fontFamily: 'Cabin Medium',
            color: Color.fromARGB(255, 161, 149, 149),
          ),
          const Spacer(flex: 1),
          CustomeButton(
            title: 'Continue',
            borderWidth: 0,
            backgroundColor: const Color(0xffB6E5B9),
            borderColor: AppColors.borderColors,
            width: MediaQuery.of(context).size.width * .5,
            textColor: AppColors.fontColor,
            onTap: () {
              Future.delayed(
                AppDuration.transitionDuration,
                () => success.goToLogin(),
              );
            },
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
