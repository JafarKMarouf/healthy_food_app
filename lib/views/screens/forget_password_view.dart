import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/forget_password_controller.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';
import 'package:healthyfood/views/widgets/auth/auth_logo.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          top: 35,
          right: 34,
          left: 34,
        ),
        height: MediaQuery.of(context).size.height * .96,
        child: GetX<ForgetPasswordControllerImp>(
          init: ForgetPasswordControllerImp(),
          builder: (controller) => Form(
            key: controller.formKey.value,
            autovalidateMode: controller.autoValidate.value,
            child: ListView(
              children: [
                const Expanded(
                  child: AuthLogo(),
                ),
                Expanded(
                    flex: 2,
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
                        const SizedBox(height: 16),
                        CustomeButton(
                          textColor: AppColors.fontColor,
                          title: 'Reset Password',
                          width: MediaQuery.of(context).size.width,
                          onTap: () {
                            if (controller.validate()) {
                              controller.goToVerify();
                            } else {
                              controller.autoValidate.value =
                                  AutovalidateMode.always;
                            }
                            // Get.toNamed(AppRoutesPage.verify);
                          },
                          backgroundColor: AppColors.backgroundColor,
                          borderColor: AppColors.borderButtonColor,
                          borderWidth: 1,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
