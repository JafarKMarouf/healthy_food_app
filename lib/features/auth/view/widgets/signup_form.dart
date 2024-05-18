import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/verification_view.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_text_form_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool visible = false;
    return SizedBox(
      height: MediaQuery.of(context).size.height * .73,
      child: Form(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/bordercamera.png'),
                      Image.asset(
                        'assets/images/camera.png',
                        color: const Color(0xff035014),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const CustomeTextFormField(
                  type: TextInputType.text,
                  isSuffix: false,
                  hintText: 'Username',
                ),
                const SizedBox(height: 18),
                CustomeTextFormField(
                  type: TextInputType.emailAddress,
                  isSuffix: false,
                  hintText: 'Email',
                  suffix: Image.asset('assets/images/edit_icon.png'),
                ),
                const SizedBox(height: 18),
                const CustomeTextFormField(
                  type: TextInputType.text,
                  isSuffix: true,
                  hintText: 'Mobile Number',
                ),
                const SizedBox(height: 18),
                CustomeTextFormField(
                  type: TextInputType.visiblePassword,
                  isObscure: visible,
                  isSuffix: true,
                  hintText: 'Password',
                  suffix: InkWell(
                    child: Image.asset(
                      'assets/images/invisible_icon.png',
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                CustomeTextFormField(
                  type: TextInputType.visiblePassword,
                  isObscure: visible,
                  isSuffix: true,
                  hintText: 'Confirm Password',
                  suffix: InkWell(
                    child: Image.asset(
                      'assets/images/invisible_icon.png',
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xffD7DDDB),
                      ),
                      color: const Color(0xffFAFFF8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Certificate PDF file',
                          style: TextStyle(
                            fontFamily: 'Cabin Medium',
                            color: khintTextColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/images/upload_icon.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1),
            CustomeButton(
              title: 'Sign up',
              width: MediaQuery.of(context).size.width,
              onTap: () {
                Get.offAll(
                  () => const VerificationView(),
                  duration: kdurationTransition,
                  transition: Transition.fadeIn,
                );
              },
              textColor: kFontColor,
              backgroundColor: kBackgroundColor,
              borderColor: kborderButtonColor,
              borderWidth: 1,
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
