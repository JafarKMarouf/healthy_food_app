import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/constants.dart';
import 'package:healthyfood/views/screens/login_view.dart';

class SplashController extends GetxController
    implements GetSingleTickerProviderStateMixin {
  final Rxn<AnimationController> _animationController =
      Rxn<AnimationController>();

  AnimationController? get animationController => _animationController.value;

  late Animation<Offset> slidingAnimation;

  @override
  void onInit() {
    super.onInit();
    initSlidingAnimation();
    navigateToLogin();
  }

  void initSlidingAnimation() {
    const duration = Duration(
      milliseconds: 10,
    );
    _animationController.value = AnimationController(
      vsync: this,
      duration: duration,
    );
    _animationController.value?.forward();
  }

  void navigateToLogin() {
    Future.delayed(
      AppConstant.kduration,
      () {
        Get.offAll(
          () => const LoginView(),
          transition: AppConstant.ktransition,
        );
      },
    );
  }

  @override
  void onClose() {
    _animationController.value?.dispose();
    super.onClose();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker((elapsed) {});
  }

  @override
  void didChangeDependencies(BuildContext context) {}
}
