import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/home_controller.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/custome_dialog.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController(
        authRepoImpl: AuthRepoImpl(apiServices: ApiServices(Dio()))));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRoutesPage.logout);
            },
            icon: const Icon(
              Icons.logout_rounded,
              color: AppColors.fontColor,
              size: 34,
            ),
          ),
        ],
        leading: Obx(
          () => homeController.userName.value != ''
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, top: 14),
                  child: Text(
                    homeController.userName.value,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              : const SizedBox(),
        ),
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(color: AppColors.fontColor, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => InkWell(
                  onLongPress: () {
                    Get.dialog(
                      DialogView(
                        text1: 'Do you want to delete this image',
                        buttons: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomeButton(
                              title: 'YES',
                              width: MediaQuery.sizeOf(context).width / 3,
                              onTap: () {
                                Get.back();
                              },
                            ),
                            CustomeButton(
                              title: 'NO',
                              width: MediaQuery.sizeOf(context).width / 3,
                              backgroundColor: Colors.red,
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: homeController.image.value == ''
                      ? const CircleAvatar(radius: 85)
                      : CircleAvatar(
                          backgroundImage: FileImage(
                            File(homeController.image.value),
                          ),
                          radius: 85,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
