import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/signup_controller.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';

class CertificateFile extends StatelessWidget {
  const CertificateFile({
    super.key,
    required this.signupController,
  });
  final SignupControllerImp signupController;

  @override
  Widget build(BuildContext context) {
    return GetX<SignupControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.selectedFilePath.value != ''
              ? Text(
                  controller.selectedFileSize.value,
                  style: const TextStyle(color: AppColors.fontColor),
                )
              //  const Icon(Icons.check, color: AppColors.fontColor)
              : const SizedBox(),
          const SizedBox(width: 4),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: controller.selectedFilePath.value == ''
                    ? const Color(0xffD7DDDB)
                    : AppColors.fontColor,
              ),
              color: const Color(0xffFAFFF8),
            ),
            child: InkWell(
              onTap: () => signupController.getFile(),
              child: controller.selectedFilePath.value == ''
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Certificate PDF file',
                          style: TextStyle(
                            fontFamily: 'Cabin Medium',
                            color: AppColors.hintTextColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          AppImages.upload,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    )
                  : Text(
                      controller.selectedFileName.value,
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Cabin Medium',
                          color: AppColors.fontColor
                          // color: AppColors.hintTextColor,
                          ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
