import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/verification_view.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool visible = true;
    return Form(
      child: Column(
        children: [
          CustomeTextFormField(
            type: TextInputType.emailAddress,
            isSuffix: false,
            hintText: 'Email',
            suffix: Image.asset('assets/images/edit_icon.png'),
          ),
          const SizedBox(height: 16),
          const CustomeTextFormField(
            type: TextInputType.text,
            isSuffix: true,
            hintText: 'Mobile Number',
          ),
          const SizedBox(height: 16),
          CustomeTextFormField(
            type: TextInputType.visiblePassword,
            isObscure: visible,
            isSuffix: true,
            hintText: 'Password',
            suffix: InkWell(
              child: Image.asset('assets/images/invisible_icon.png'),
            ),
          ),
          const SizedBox(height: 16),
          CustomeButton(
            title: 'Log in',
            width: MediaQuery.of(context).size.width,
            onTap: () {
              Get.to(
                () => const VerificationView(),
                duration: kdurationTransition,
                transition: Transition.fadeIn,
              );
            },
            backgroundColor: kBackgroundColor,
            borderColor: kborderButtonColor,
            borderWidth: 1,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/checkcircle.svg',
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: kFontColor,
                      fontSize: 13,
                      fontFamily: 'Montaga',
                    ),
                  ),
                ],
              ),
              const Text(
                'Forget Password?',
                style: TextStyle(
                  color: kFontColor,
                  fontSize: 14,
                  fontFamily: 'Cabin',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
