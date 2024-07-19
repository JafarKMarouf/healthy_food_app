import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/controllers/auth/signup_controller.dart';
import 'package:healthyfood/core/functions/validator.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/certificate_file.dart';
import 'package:healthyfood/views/widgets/auth/row_signup.dart';
import 'custome_select_image.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthRepoImpl authRepoImpl = AuthRepoImpl(apiServices: ApiServices(Dio()));
    SignupControllerImp signupController =
        Get.put(SignupControllerImp(authRepoImpl: authRepoImpl));
    return SingleChildScrollView(
      child: GetX<SignupControllerImp>(
        builder: (controller) => Form(
          key: signupController.formKey,
          autovalidateMode: signupController.autoValidate.value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(border: InputBorder.none),
                    style: const TextStyle(fontSize: 0),
                    keyboardType: TextInputType.none,
                    controller: signupController.imageController,
                    validator: (value) {
                      return validate(
                        value: value!,
                        type: 'image',
                      );
                    },
                  ),
                  CustomeSelectImage(signupController: signupController),
                ],
              ),
              const SizedBox(height: 14),
              CustomeTextFormField(
                controller: signupController.usernameController,
                type: TextInputType.text,
                isSuffix: false,
                hintText: 'Username',
                validate: (value) => validate(
                  value: value!,
                  min: 5,
                  max: 30,
                  type: 'username',
                ),
              ),
              const SizedBox(height: 14),
              CustomeTextFormField(
                controller: signupController.emailController,
                type: TextInputType.emailAddress,
                isSuffix: false,
                hintText: 'Email',
                suffix: Image.asset(AppImages.edit),
                validate: (value) => validate(
                  value: value!,
                  type: 'email',
                ),
              ),
              const SizedBox(height: 14),
              CustomeTextFormField(
                controller: signupController.mobileController,
                type: TextInputType.phone,
                isSuffix: true,
                hintText: 'Mobile: 963 9XXXXXXXX',
                validate: (value) => validate(
                  value: value!,
                  type: 'mobile',
                ),
              ),
              const SizedBox(height: 14),
              CustomeTextFormField(
                  controller: controller.passwordController,
                  type: TextInputType.visiblePassword,
                  isObscure: signupController.visible1.value,
                  isSuffix: true,
                  hintText: 'Password',
                  suffix: InkWell(
                    onTap: () {
                      controller.visible1.value = !controller.visible1.value;
                    },
                    child: controller.visible1.value
                        ? Image.asset(AppImages.invisible)
                        : const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.hintTextColor,
                          ),
                  ),
                  validate: (value) {
                    return validate(
                      value: value!,
                      type: 'password',
                    );
                  }),
              const SizedBox(height: 14),
              CustomeTextFormField(
                  controller: controller.confirmPasswordController,
                  type: TextInputType.visiblePassword,
                  isObscure: signupController.visible2.value,
                  isSuffix: true,
                  hintText: 'Confirm Password',
                  suffix: InkWell(
                    onTap: () {
                      controller.visible2.value = !controller.visible2.value;
                    },
                    child: controller.visible2.value
                        ? Image.asset(AppImages.invisible)
                        : const Icon(
                            Icons.remove_red_eye_outlined,
                            color: AppColors.hintTextColor,
                          ),
                  ),
                  validate: (value) {
                    if (value != controller.passwordController.text) {
                      return 'not match';
                    }
                    return validate(
                      value: value!,
                      type: 'password confirm',
                    );
                  }),
              const SizedBox(height: 14),
              Stack(
                alignment: Alignment.center,
                children: [
                  TextFormField(
                    readOnly: true,
                    style: const TextStyle(fontSize: 0),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                    ),
                    keyboardType: TextInputType.none,
                    controller: signupController.fileController,
                    validator: (value) => validate(
                      value: value!,
                      type: 'file',
                    ),
                  ),
                  CertificateFile(signupController: signupController)

                ],
              ),
              const SizedBox(height: 14),
              CustomeButton(
                title: 'Sign up',
                width: MediaQuery.of(context).size.width,
                onTap: () async {
                  if (signupController.validate()) {
                    if (signupController.isConn.value) {
                      await signupController.signup(
                        photo: signupController.imageController!.text,
                        username: signupController.usernameController.text,
                        email: signupController.emailController.text,
                        mobile: signupController.mobileController.text,
                        password: signupController.passwordController.text,
                        confirmPassword:
                            signupController.confirmPasswordController.text,
                        file: signupController.fileController!.text,
                      );
                    } else {
                      Get.snackbar('warning', 'You are offline');
                    }
                  } else {
                    signupController.autoValidate.value =
                        AutovalidateMode.always;
                  }
                  log(signupController.imageController!.text);
                },
                textColor: AppColors.fontColor,
                backgroundColor: AppColors.backgroundColor,
                borderColor: AppColors.borderButtonColor,
                borderWidth: 1,
              ),
              const SizedBox(height: 8),
              const RowSignup(),
            ],
          ),
        ),
      ),
    );
  }
}
