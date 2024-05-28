import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/constants/constants.dart';
import 'package:healthyfood/core/functions/show_dialog.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';
import 'package:healthyfood/controllers/auth/logincontroller.dart';
import 'package:healthyfood/views/widgets/auth/custome_fails.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginControllerImp = Get.put(LoginControllerImp());
    return SizedBox(
      // height: MediaQuery.of(context).size.height * .45,
      child: Form(
        key: loginControllerImp.formKey,
        autovalidateMode: loginControllerImp.autoValidate,
        child: Column(
          children: [
            CustomeTextFormField(
              type: TextInputType.emailAddress,
              isSuffix: false,
              hintText: 'Email',
              suffix: Image.asset(AppImages.edit),
              validate: (value) {
                if (value!.isEmpty) {
                  return "email is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 18),
            CustomeTextFormField(
              type: TextInputType.number,
              isSuffix: true,
              hintText: 'Mobile Number',
              validate: (value) {
                if (value!.isEmpty) {
                  return "mobile number is required";
                }
                return null;
              },
            ),
            const SizedBox(height: 18),
            GetX<LoginControllerImp>(
              builder: (controller) => CustomeTextFormField(
                validate: (value) {
                  if (value!.isEmpty) {
                    return "password is required";
                  }
                  if (value.length < 6) {
                    return 'password must contain at least 6 character';
                  }
                  return null;
                },
                type: TextInputType.visiblePassword,
                isObscure: controller.visible.value,
                isSuffix: true,
                hintText: 'Password',
                suffix: InkWell(
                  onTap: () {
                    controller.visible.value = !controller.visible.value;
                  },
                  child: controller.visible.value
                      ? Image.asset(AppImages.invisible)
                      : const Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.hintTextColor,
                        ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            CustomeButton(
              textColor: AppColors.fontColor,
              title: 'Log in',
              width: MediaQuery.of(context).size.width,
              onTap: () {
                if (loginControllerImp.validate()) {
                  // here you must call login method and
                  // go to verify otp if login is success or
                  // go show error dialog ontherwise

                  loginControllerImp.login();

                  customeShowDialog(
                    context,
                    const CustomeFails(),
                    duration: AppConstant.kduration,
                  );
                } else {
                  loginControllerImp.autoValidate = AutovalidateMode.always;
                }
              },
              backgroundColor: AppColors.backgroundColor,
              borderColor: AppColors.borderButtonColor,
              borderWidth: 1,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}