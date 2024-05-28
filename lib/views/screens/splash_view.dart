import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/controllers/splashcontroller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Center(
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
