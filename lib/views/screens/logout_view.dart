import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/controllers/auth/logout_controller.dart';
import 'package:healthyfood/views/widgets/auth/custome_dialog.dart';
import 'package:healthyfood/views/widgets/auth/logout_buttons.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutControllerImpl controller = Get.put(LogoutControllerImpl());

    return DialogView(
      image: AppImages.logout,
      text1: 'Oh no! You’re leaving...',
      text2: 'Are you sure?',
      buttons: const LogoutButtons(),
      tapImage: () {
        controller.logout();
        controller.goToLogin();
      },
    );
  }
}
