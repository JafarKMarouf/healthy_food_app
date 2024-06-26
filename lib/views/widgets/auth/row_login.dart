import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/login_controller.dart';

import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/shared/custome_text.dart';

class RowLogin extends StatelessWidget {
  const RowLogin({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.find();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              AppImages.checkcircle,
              height: 16,
              width: 16,
            ),
            const SizedBox(width: 4),
            const CustomeText(
              text: 'Remember me',
            )
          ],
        ),
        InkWell(
          onTap: () {
            controller.goToResetPassword();
          },
          child: const CustomeText(
            text: 'Forget Password?',
            fontSize: 14,
            fontFamily: 'Cabin',
          ),
        ),
      ],
    );
  }
}
