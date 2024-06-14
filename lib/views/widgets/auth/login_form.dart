import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/functions/show_dialog.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';
import 'package:healthyfood/controllers/auth/logincontroller.dart';
import 'package:healthyfood/views/widgets/auth/custome_fails.dart';
import 'package:healthyfood/views/widgets/auth/row_login.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});
  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginControllerImp = Get.find();
    return GetX<LoginControllerImp>(
      builder: (controller) => Form(
        key: loginControllerImp.formKey.value,
        autovalidateMode: loginControllerImp.autoValidate.value,
        child: Column(
          children: [
            CustomeTextFormField(
              controller: controller.emailController,
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
            const SizedBox(height: 14),
            CustomeTextFormField(
              controller: controller.mobileController,
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
            const SizedBox(height: 14),
            CustomeTextFormField(
              controller: controller.passwordController,
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
                    ? Image.asset(
                        AppImages.invisible,
                        color: AppColors.hintTextColor,
                      )
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.hintTextColor,
                      ),
              ),
            ),
            const SizedBox(height: 14),
            CustomeButton(
              textColor: AppColors.fontColor,
              title: 'Log in',
              width: MediaQuery.of(context).size.width,
              onTap: () {
                if (loginControllerImp.validate()) {
                  // here you must call login method and
                  // go to verify otp if login is success or
                  // go show error dialog otherwise
                  loginControllerImp.login();
                customeShowDialog(
                  context,
                  const CustomeFails(),
                  duration: AppDuration.dialogDuration,
                  
                );
                } else {
                  loginControllerImp.autoValidate.value =
                      AutovalidateMode.always;
                }
              },
              backgroundColor: AppColors.backgroundColor,
              borderColor: AppColors.borderButtonColor,
              borderWidth: 1,
            ),
            const SizedBox(height: 8),
            const RowLogin(),
          ],
        ),
      ),
    );
  }
}
