import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_images.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // clipBehavior: Clip.hardEdge,
      child: Image.asset(
        AppImages.logo,
        // fit: BoxFit.fill,
        // fit: BoxFit.fitHeight,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
