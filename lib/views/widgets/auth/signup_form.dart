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
                  min: 6,
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
                type: TextInputType.number,
                isSuffix: true,
                hintText: 'Mobile Number',
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
                validate: (value) => validate(
                  value: value!,
                  type: 'password',
                ),
              ),
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
                validate: (value) => validate(
                  value: value!,
                  type: 'password confirm',
                ),
              ),
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
                    controller: signupController.fileController!,
                    validator: (value) => validate(
                      value: value!,
                      type: 'file',
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      signupController.fileController!.text =
                          await signupController.uploadCertificate() ?? '';
                      // Get.snackbar(
                      //   'file',
                      //   signupController.fileController!.text,
                      // );
                    },
                    child: const CertificateFile(),
                  )
                ],
              ),
              const SizedBox(height: 14),
              CustomeButton(
                title: 'Sign up',
                width: MediaQuery.of(context).size.width,
                onTap: () {
                  signupController.signup(
                    photo: signupController.imageController!.text,
                    username: signupController.usernameController.text,
                    email: signupController.emailController.text,
                    mobile: signupController.mobileController.text,
                    password: signupController.passwordController.text,
                    confirmPassword:
                        signupController.confirmPasswordController.text,
                    file: signupController.fileController!.text,
                  );
                  // here you must call signup method and
                  // go to verify otp if signup is success or
                  // go show error dialog otherwise
                  // if (signupController.validate()) {
                  //   // signupController.goToVerify();
                  // } else {
                  //   signupController.autoValidate.value =
                  //       AutovalidateMode.always;
                  // }
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
