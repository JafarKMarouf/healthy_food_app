import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/signup_controller.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/views/widgets/auth/custome_dialog.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_images.dart';

class CustomeSelectImage extends StatelessWidget {
  const CustomeSelectImage({
    super.key,
    required this.signupController,
  });

  final SignupControllerImp signupController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          barrierDismissible: false,
          DialogView(
            text1: 'Select Image from',
            buttons: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        signupController.getImage(ImageSource.gallery);
                      },
                      color: AppColors.fontColor,
                      iconSize: 50,
                      icon: const Icon(Icons.photo_size_select_actual_outlined),
                    ),
                    const Text(
                      'gallery',
                      style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        signupController.getImage(ImageSource.camera);
                      },
                      color: AppColors.fontColor,
                      iconSize: 50,
                      icon: const Icon(Icons.photo_camera),
                    ),
                    const Text(
                      'camera',
                      style: TextStyle(
                        color: AppColors.fontColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      child: Obx(
        () => signupController.selectedImagePath.value == ''
            ? Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(AppImages.camera),
                  SvgPicture.asset(AppImages.bordercamera),
                ],
              )
            : CircleAvatar(
                backgroundImage: FileImage(
                  File(signupController.selectedImagePath.value),
                ),
                radius: 60,
              ),
        // Column(
        //   children: [

        //     const SizedBox(height: 4),
        //     Text(
        //       signupController.compressImageSize.value,
        //       style: const TextStyle(color: AppColors.fontColor),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
