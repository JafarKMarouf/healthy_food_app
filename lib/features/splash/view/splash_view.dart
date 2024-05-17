import 'package:flutter/material.dart';
import 'package:healthyfood/features/splash/view/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.grey,
      body: SplashBody(),
    );
  }
}
