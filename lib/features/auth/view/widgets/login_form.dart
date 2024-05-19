import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/core/reusable_widgets/custome_dialog.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_text_form_field.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_fails.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autoValidate = AutovalidateMode.disabled;

    bool visible = true;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: Column(
        children: [
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
            type: TextInputType.number,
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
            validate: (value) {
              if (value!.isEmpty) {
                return "password is require";
              }
              if (value.length < 8) {
                return 'password is short';
              }
              return null;
            },
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
            textColor: kFontColor,
            title: 'Log in',
            width: MediaQuery.of(context).size.width,
            onTap: () {
              if (formKey.currentState!.validate()) {
                customeShowDialog(
                  context,
                  const CustomeFails(),
                  duration: const Duration(milliseconds: 2500),
                );
              } else {
                autoValidate = AutovalidateMode.always;
              }
            },
            backgroundColor: kBackgroundColor,
            borderColor: kBorderButtonColor,
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
