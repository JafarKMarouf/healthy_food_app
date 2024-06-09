import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/constants.dart';

class SplashController extends GetxController
    implements GetSingleTickerProviderStateMixin {
  late Animation<Offset> slidingAnimation;
  late AnimationController _animationController;
  @override
  void onInit() {
    super.onInit();
    initSlidingAnimation();
    navigateToLogin();
  }

  void initSlidingAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: AppConstant.kduration);

    slidingAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(2, 4),
    ).animate(_animationController);
    _animationController.forward();
  }

  void navigateToLogin() {
    Future.delayed(
      AppConstant.kduration,
      () {
        Get.offAllNamed('login');
      },
    );
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker((elapsed) {});
  }

  @override
  void didChangeDependencies(BuildContext context) {}
}
