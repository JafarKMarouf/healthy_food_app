import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/auth/view/signup_view.dart';
import 'package:healthyfood/features/auth/view/verification_view.dart';
import 'package:healthyfood/features/splash/view/splash_view.dart';

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
      home: const LoginView(),
    );
  }
}
