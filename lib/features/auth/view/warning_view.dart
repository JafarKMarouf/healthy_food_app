import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text.dart';
import 'package:healthyfood/features/auth/controller/errorcontroller.dart';
import 'package:healthyfood/core/shared/custome_dialog.dart';

class WarningView extends StatelessWidget {
  const WarningView({super.key});

  @override
  Widget build(BuildContext context) {
    WarningControllerImpl warning = Get.put(WarningControllerImpl());
    return DialogView(
      image: AppImages.error,
      text1: 'Oh no!',
      text2: 'Something went wrong.',
      text3: const CustomeText(
        text: 'Please try again.',
        fontFamily: 'Montaga',
        color: Colors.black,
        fontSize: 12,
      ),
      buttons: CustomeButton(
        title: 'Try again',
        width: 120,
        fontSize: 12,
        onTap: () {
          warning.tryAgain();
        },
      ),
      tapImage: () {
        warning.tryAgain();
      },
    );
  }
}
