import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/auth/view/widgets/signup_form.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45,
        right: 34,
        left: 34,
      ),
      child: ListView(
        children: [
          SizedBox(
            width: 262,
            height: 130,
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SignupForm(),
          // const SizedBox(height: 8),
        ],
      ),
    );
  }
}
