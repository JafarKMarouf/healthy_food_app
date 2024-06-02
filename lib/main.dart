import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/views/screens/login_view.dart';
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
      home: const SplashView(),
      // ignore: prefer_const_literals_to_create_immutables
      routes: {
        'login': (p0) => const LoginView(),
        'signup': (p1) => const SignupView(),
        'verify': (p2) => const VerificationView(),
        'warning': (p2) => const WarningView(),
      },
    );
  }
}
