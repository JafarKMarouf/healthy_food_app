import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/functions/validator.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';
import 'package:healthyfood/controllers/auth/login_controller.dart';
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
              hintText: controller.isRememberMe.value &&
                      controller.emailController.text != ''
                  ? controller.emailController.text
                  : 'Email',
              suffix: Image.asset(AppImages.edit),
              validate: (value) => validate(
                value: value!,
                min: 6,
                max: 45,
                type: 'email',
              ),
            ),
            const SizedBox(height: 14),
            CustomeTextFormField(
              controller: controller.mobileController,
              type: TextInputType.phone,
              isSuffix: true,
              hintText: controller.isRememberMe.value &&
                      controller.mobileController.text != ''
                  ? controller.mobileController.text
                  : 'Mobile Number',
              validate: (value) => validate(
                value: value!,
                min: 13,
                max: 16,
                type: 'mobile',
              ),
            ),
            const SizedBox(height: 14),
            CustomeTextFormField(
              controller: controller.passwordController,
              // validate: (value) => validate(
              //   value: value!,
              //   min: 8,
              //   type: 'password',
              // ),
              type: TextInputType.visiblePassword,
              isObscure: controller.visible.value,
              isSuffix: true,
              hintText: controller.isRememberMe.value &&
                      controller.passwordController.text != ''
                  ? controller.passwordController.text
                  : 'Password',
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
              onTap: () async {
                if (loginControllerImp.validate()) {
                  if (loginControllerImp.isConn.value) {
                    await loginControllerImp.login(
                      email: loginControllerImp.emailController.text,
                      password: loginControllerImp.passwordController.text,
                      mobile: loginControllerImp.mobileController.text,
                    );
                  } else {
                    Get.snackbar('warning', 'You are offline');
                  }
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
