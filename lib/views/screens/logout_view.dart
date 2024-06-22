import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/controllers/auth/logout_controller.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/custome_dialog.dart';
import 'package:healthyfood/views/widgets/auth/logout_buttons.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogoutView extends StatelessWidget {
  const LogoutView({super.key});

  @override
  Widget build(BuildContext context) {
    LogoutControllerImpl controller = Get.put(LogoutControllerImpl(
        authRepoImpl: AuthRepoImpl(apiServices: ApiServices(Dio()))));

    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.loading.value,
        child: DialogView(
          image: AppImages.logout,
          text1: 'Oh no! You’re leaving...',
          text2: 'Are you sure?',
          buttons: const LogoutButtons(),
          tapImage: () {
            if (controller.isConn.value) {
              controller.logout();
            } else {
              Get.back();
              Get.snackbar('warning', 'you are offline');
            }
          },
        ),
      ),
    );
  }
}
