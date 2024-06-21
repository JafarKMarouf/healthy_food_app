import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/constants/app_transitions.dart';
import 'package:healthyfood/views/screens/forget_password_view.dart';
import 'package:healthyfood/views/screens/home_view.dart';
import 'package:healthyfood/views/screens/login_view.dart';
import 'package:healthyfood/views/screens/logout_view.dart';
import 'package:healthyfood/views/screens/signup_view.dart';
import 'package:healthyfood/views/screens/splash_view.dart';
import 'package:healthyfood/views/screens/verification_view.dart';
import 'package:healthyfood/views/screens/warning_view.dart';

void main() {
  runApp(const HealthyFood());
}

class HealthyFood extends StatelessWidget {
  const HealthyFood({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montaga',
      ),
      getPages: [
        GetPage(
          name: AppRoutesPage.splash,
          page: () => const SplashView(),
          transition: AppTransitions.primaryTransition,
          transitionDuration: AppDuration.transitionDuration,
        ),
        GetPage(
          name: AppRoutesPage.login,
          page: () => const LoginView(),
          transitionDuration: AppDuration.transitionDuration,
          transition: AppTransitions.primaryTransition,
        ),
        GetPage(
          name: AppRoutesPage.signup,
          page: () => const SignupView(),
          transitionDuration: AppDuration.transitionDuration,
          transition: AppTransitions.primaryTransition,
        ),
        GetPage(
          name: AppRoutesPage.verify,
          page: () => const VerificationView(),
          curve: Curves.easeIn,
          transitionDuration: AppDuration.transitionDuration,
          transition: AppTransitions.primaryTransition,
        ),
        GetPage(
          name: AppRoutesPage.warning,
          page: () => const WarningView(),
          transitionDuration: AppDuration.dialogDuration,
        ),
        GetPage(
          name: AppRoutesPage.forgetpassword,
          page: () => const ForgetPasswordView(),
          transitionDuration: AppDuration.transitionDuration,
          transition: AppTransitions.primaryTransition,
        ),
        GetPage(
          name: AppRoutesPage.logout,
          page: () => const LogoutView(),
          transitionDuration: AppDuration.dialogDuration,
        ),
        GetPage(
          name: AppRoutesPage.home,
          page: () => const HomeView(),
          transitionDuration: AppDuration.transitionDuration,
        ),
      ],
    );
  }
}
