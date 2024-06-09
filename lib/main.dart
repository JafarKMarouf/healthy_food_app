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
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashView()),
        GetPage(
          name: '/login',
          page: () => const LoginView(),
        ),
        GetPage(name: '/signup', page: () => const SignupView()),
        GetPage(name: '/verify', page: () => const VerificationView()),
        GetPage(name: '/warning', page: () => const WarningView()),
      ],
    );
  }
}
