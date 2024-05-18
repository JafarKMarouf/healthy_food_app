import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/auth/view/verification_view.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_text_form_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool visible = false;
    GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autoValidate = AutovalidateMode.disabled;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: formKey,
        autovalidateMode: autoValidate,
        child: Column(
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
            const SizedBox(height: 16),
            CustomeTextFormField(
              type: TextInputType.text,
              isSuffix: false,
              hintText: 'Username',
              validate: (value) {
                if (value!.isEmpty) {
                  return "user is require";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomeTextFormField(
              type: TextInputType.emailAddress,
              isSuffix: false,
              hintText: 'Email',
              suffix: Image.asset('assets/images/edit_icon.png'),
              validate: (value) {
                if (value!.isEmpty) {
                  return "email is require";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomeTextFormField(
              type: TextInputType.text,
              isSuffix: true,
              hintText: 'Mobile Number',
              validate: (value) {
                if (value!.isEmpty) {
                  return "mobile number is require";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
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
              validate: (value) {
                if (value!.isEmpty) {
                  return "password is require";
                }
                if (value.length < 8) {
                  return 'password is short';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
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
              validate: (value) {
                if (value!.isEmpty) {
                  return "password is require";
                }
                if (value.length < 8) {
                  return 'password is short';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 24),
            CustomeButton(
              title: 'Sign up',
              width: MediaQuery.of(context).size.width,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Get.off(
                    () => const VerificationView(),
                    duration: kdurationTransition,
                    transition: Transition.fadeIn,
                  );
                } else {
                  autoValidate = AutovalidateMode.always;
                }
              },
              textColor: kFontColor,
              backgroundColor: kBackgroundColor,
              borderColor: kborderButtonColor,
              borderWidth: 1,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account ? ',
                  style: TextStyle(
                    fontFamily: 'Cabin Medium',
                    color: kFontColor,
                    fontSize: 14,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offAll(
                      () => const LoginView(),
                      duration: kdurationTransition,
                      transition: Transition.fadeIn,
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontFamily: 'Cabin Medium',
                      fontSize: 14,
                      color: Color(0xff25A340),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
