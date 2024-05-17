import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/auth/view/widgets/signup_form.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 45,
          right: 34,
          left: 34,
        ),
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account ? ',
                  style: TextStyle(
                    fontFamily: 'Cabin Medium',
                    color: kFontColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(
                      () => const LoginView(),
                      duration: kdurationTransition,
                      transition: Transition.fadeIn,
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontFamily: 'Cabin Medium',
                      fontSize: 12,
                      color: Color(0xff25A340),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
