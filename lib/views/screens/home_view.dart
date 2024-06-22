import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_routes_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoutesPage.logout);
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: AppColors.borderButtonColor,
                size: 34,
              )),
        ],
      ),
      body: const Center(child: Text('home')),
    );
  }
}
