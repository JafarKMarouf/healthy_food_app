import 'package:flutter/material.dart';
import 'package:healthyfood/features/auth/view/widgets/auth_logo.dart';
import 'package:healthyfood/features/auth/view/widgets/row_signup.dart';
import 'package:healthyfood/features/auth/view/widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1.07,
        padding: const EdgeInsets.only(
          top: 45,
          right: 34,
          left: 34,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .16,
              child: const AuthLogo(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            const SignupForm(),
            const RowSignup(),
          ],
        ),
      ),
    );
  }
}
