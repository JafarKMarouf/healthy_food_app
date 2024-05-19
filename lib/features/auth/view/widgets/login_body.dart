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
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1.08,
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          children: [
            Image.asset(
              'assets/images/image.png',
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .45,
                    child: const LoginForm(),
                  ),
                  CustomeButton(
                    textColor: kFontColor,
                    title: 'Create new account',
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      Get.offAll(
                        () => const SignupView(),
                        duration: kDurationTransition,
                        transition: Transition.fadeIn,
                      );
                    },
                    backgroundColor: kFillFormColor,
                    borderColor: const Color(0xffA3C5B0),
                    borderWidth: 2,
                  ),
                  // const Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
