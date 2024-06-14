import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/signupcontroller.dart';

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
        Get.defaultDialog(
          title: 'Select an Image via',
          middleText: '',
          actions: [
            ElevatedButton(
              onPressed: () async {
                signupController.imageController!.text =
                    await signupController.uploadImage(uploadType: 'gallery') ??
                        '';
                Get.back();
                Get.snackbar(
                  'image',
                  signupController.imageController!.text,
                );
              },
              child: const Icon(
                Icons.photo,
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                signupController.imageController!.text =
                    await signupController.uploadImage(uploadType: 'camera') ??
                        '';
                Get.back();
                Get.snackbar(
                  'image',
                  signupController.imageController!.text,
                );
                Get.snackbar(
                  'image',
                  signupController.imageController!.text,
                );
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
      ),
    );
  }
}
