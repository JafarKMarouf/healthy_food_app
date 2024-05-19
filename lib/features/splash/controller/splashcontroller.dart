import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';

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
      const Duration(
        milliseconds: 3000,
      ),
      () {
        Get.offAll(
          () => const LoginView(),
          transition: Transition.fadeIn,
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
