import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/features/auth/controller/signupcontroller.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';
import 'package:healthyfood/features/auth/view/widgets/certificate_file.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp signupController = Get.put(SignupControllerImp());

    return Form(
      key: signupController.formKey,
      autovalidateMode: signupController.autoValidate.value,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              signupController.uploadImage();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AppImages.camera),
                SvgPicture.asset(AppImages.bordercamera),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .04),
          CustomeTextFormField(
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
          const SizedBox(height: 21),
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
          const SizedBox(height: 21),
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
          const SizedBox(height: 21),
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
                    : Image.asset(AppImages.visible),
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
          const SizedBox(height: 21),
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
                    : Image.asset(AppImages.visible),
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
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              signupController.uploadCertificate();
            },
            child: const CertificateFile(),
          ),
          const SizedBox(height: 21),
          CustomeButton(
            title: 'Sign up',
            width: MediaQuery.of(context).size.width,
            onTap: () {
              // here you must call signup method and
              // go to verify otp if signup is success or
              // go show error dialog ontherwise
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
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
