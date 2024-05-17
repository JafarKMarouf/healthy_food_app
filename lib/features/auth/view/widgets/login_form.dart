import 'package:flutter/material.dart';
import 'package:healthyfood/core/constant.dart';
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
            type: TextInputType.text,
            isSuffix: false,
            hintText: 'email',
            suffix: Image.asset('assets/images/edit_icon.png'),
          ),
          const SizedBox(
            height: 16,
          ),
          const CustomeTextFormField(
            type: TextInputType.text,
            isSuffix: true,
            hintText: 'Mobile Number',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomeTextFormField(
            type: TextInputType.visiblePassword,
            isObscure: visible,
            isSuffix: true,
            hintText: 'Password',
            suffix: InkWell(
                // child: visible
                child: Image.asset(
              'assets/images/invisible_icon.png',
            )
                // : Image.asset('assets/images/invisible_icon.png'),
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomeButton(
            title: 'Log in',
            width: MediaQuery.of(context).size.width,
            onTap: () {},
            backgroundColor: kBackgroundColor,
            borderColor: kborderButtonColor,
            borderWidth: 1,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/checkcircle.png',
                    color: const Color(0xff035014),
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: kFontColor,
                      fontSize: 13,
                      // fontWeight: FontWeight.w600,
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
