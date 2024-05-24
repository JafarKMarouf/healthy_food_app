import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_images.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      fit: BoxFit.fitWidth,
    );
  }
}
