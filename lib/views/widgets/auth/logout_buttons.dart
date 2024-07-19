import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/controllers/auth/logout_controller.dart';

class LogoutButtons extends StatelessWidget {
  const LogoutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutControllerImpl controller = Get.find<LogoutControllerImpl>();

    return Column(
      children: [
        CustomeButton(
          title: 'No',
          backgroundColor: const Color(0xffB6E5B9),
          textColor: AppColors.fontColor,
          width: MediaQuery.of(context).size.width / 2.8,
          fontSize: 12,
          onTap: () {
            Get.back();
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        CustomeButton(
          title: 'Yes,Log Me Out',
          backgroundColor: const Color(0xffB6E5B9),
          textColor: AppColors.fontColor,
          width: MediaQuery.of(context).size.width / 2.8,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          onTap: () {
            if (controller.isConn.value) {
              controller.logout();
            } else {
              Get.back();
              Get.snackbar('warning', 'you are offline');
            }
          },
        )
      ],
    );
  }
}
