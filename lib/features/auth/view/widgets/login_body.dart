import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/signup_view.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';
import 'package:healthyfood/features/auth/view/widgets/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Image.asset(
            'assets/images/image.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Expanded(
                    child: LoginForm(),
                  ),
                ),
                CustomeButton(
                  title: 'Create new account',
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    Get.to(
                      () => const SignupView(),
                      duration: kdurationTransition,
                      transition: Transition.fadeIn,
                    );
                  },
                  backgroundColor: kFillFormColor,
                  borderColor: const Color(0xffA3C5B0),
                  borderWidth: 2,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
