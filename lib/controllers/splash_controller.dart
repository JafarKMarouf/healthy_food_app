import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/utils/app_storage.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final Rxn<AnimationController> _animationController =
      Rxn<AnimationController>();
  AnimationController? get animationController => _animationController.value;

  final Rxn<Animation<Offset>> _offsetAnimation = Rxn<Animation<Offset>>();
  Animation<Offset>? get offsetAnimation => _offsetAnimation.value;
  // String token;

  Future<void> loadingUserInfo() async {
    var token = await AppStorage.getToken();
    log('======token:$token===');
    token != null ? navigateToHome() : navigateToLogin();
  }

  @override
  void onInit() async {
    super.onInit();
    slidingAnimation();
    await loadingUserInfo();
  }

  void slidingAnimation() {
    const duration = AppDuration.splashDuration;
    _animationController.value = AnimationController(
      vsync: this,
      duration: duration,
    );
    _offsetAnimation.value = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 1),
    )
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_animationController.value!)
      ..addListener(() {
        update();
      });

    _animationController.value?.forward();
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.offAllNamed(AppRoutesPage.login);
      },
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Get.offAllNamed(AppRoutesPage.home);
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.value?.dispose();
  }
}
