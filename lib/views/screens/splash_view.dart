import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      body: AnimatedBuilder(
        animation: controller.animationController!,
        builder: (context, child) => SlideTransition(
          position: controller.offsetAnimation!,
          child: Hero(
            tag: 'logo${AppImages.logo}',
            child: Image.asset(
              AppImages.logo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
