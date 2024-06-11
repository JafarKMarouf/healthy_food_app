import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/controllers/auth/signupcontroller.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';
import 'package:healthyfood/views/widgets/auth/certificate_file.dart';
import 'package:healthyfood/views/widgets/auth/row_signup.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp signupController = Get.put(SignupControllerImp());
    dynamic selectedImage;
    dynamic selectedFile;
    return Form(
      key: signupController.formKey,
      autovalidateMode: signupController.autoValidate.value,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 4 / 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetBuilder<SignupControllerImp>(
              builder: (context) {
                return selectedImage == null
                    ? GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            title: 'Select an Image via',
                            middleText: '',
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  selectedImage =
                                      await signupController.uploadImage(
                                    uploadType: 'gallary',
                                  );
                                  Get.back();
                                  // Get.snackbar('image', '$selectedImage');
                                },
                                child: const Icon(
                                  Icons.photo,
                                ),
                              ),
                              const SizedBox(height: 32),
                              ElevatedButton(
                                onPressed: () async {
                                  selectedImage = await signupController
                                      .uploadImage(uploadType: 'camera');
                                  Get.back();
                                  log('$selectedImage');
                                  Get.snackbar('image', '$selectedImage');
                                },
                                child: const Icon(Icons.camera_alt_outlined),
                              ),
                            ],
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(AppImages.camera),
                            SvgPicture.asset(AppImages.bordercamera),
                          ],
                        ))
                    : CircleAvatar(
                        radius: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: Image.file(selectedImage),
                        ),
                      );
              },
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                CustomeTextFormField(
                  // textEditingController: ,
                  type: TextInputType.text,
                  isSuffix: false,
                  hintText: 'Username',
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "user is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),
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
                const SizedBox(height: 14),
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
                const SizedBox(height: 14),
                GetX<SignupControllerImp>(
                  builder: (controller) => CustomeTextFormField(
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
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      if (value.length < 6) {
                        return 'password must contain at least 6 character';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 14),
                GetX<SignupControllerImp>(
                  builder: (controller) => CustomeTextFormField(
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
                      if (value!.isEmpty) {
                        return "password is required";
                      }
                      if (value.length < 6) {
                        return 'password must contain at least 6 character';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            GetBuilder<SignupControllerImp>(
              builder: (context) {
                return selectedFile == null
                    ? GestureDetector(
                        onTap: () async {
                          selectedFile =
                              await signupController.uploadCertificate();
                          log('$selectedFile');
                          Get.snackbar('upload file', '$selectedFile');
                        },
                        child: const CertificateFile(),
                      )
                    : const Text('selected File');
              },
            ),
            const SizedBox(height: 16),
            CustomeButton(
              title: 'Sign up',
              width: MediaQuery.of(context).size.width,
              onTap: () {
                // here you must call signup method and
                // go to verify otp if signup is success or
                // go show error dialog otherwise
                signupController.signup();
                if (signupController.validate()) {
                  signupController.goToVerify();
                } else {
                  signupController.autoValidate.value = AutovalidateMode.always;
                }
              },
              textColor: AppColors.fontColor,
              backgroundColor: AppColors.backgroundColor,
              borderColor: AppColors.borderButtonColor,
              borderWidth: 1,
            ),
            const RowSignup(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
