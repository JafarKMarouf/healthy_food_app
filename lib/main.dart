import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/features/splash/view/splash_view.dart';

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
      home: const SplashView(),
    );
  }
}
