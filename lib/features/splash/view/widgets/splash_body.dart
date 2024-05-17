import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/features/splash/controller/splashcontroller.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Center(
                child: Image.asset(
                  'assets/images/image.png',
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
