import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/splash/view/widgets/splash_body.dart';

void main() {
  runApp(const FoodHealthy());
}

class FoodHealthy extends StatelessWidget {
  const FoodHealthy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montaga',
      ),
      routes: {
        'login': (p0) => const LoginView(),
        // 'signup' : ()=> const
      },
      home: const SplashBody(),
    );
  }
}
