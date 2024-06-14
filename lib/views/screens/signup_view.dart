import 'package:flutter/material.dart';
import 'package:healthyfood/views/widgets/auth/auth_logo.dart';
import 'package:healthyfood/views/widgets/auth/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1.5,
        padding: const EdgeInsets.only(
          right: 34,
          left: 34,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 5,
              child: const AuthLogo(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 4 / 5,
              child: const SignupForm(),
            ),
            // const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
