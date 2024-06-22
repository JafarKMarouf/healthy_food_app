import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/controllers/auth/signup_controller.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/auth_logo.dart';
import 'package:healthyfood/views/widgets/auth/signup_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    SignupControllerImp signupControllerImp = Get.put(SignupControllerImp(
        authRepoImpl: AuthRepoImpl(apiServices: ApiServices(Dio()))));
    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          color: AppColors.fontColor,
          inAsyncCall: signupControllerImp.loading.value,
          child: Container(
            height: MediaQuery.of(context).size.height * 1.5,
            padding: const EdgeInsets.only(
              right: 34,
              left: 34,
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 5,
                  child: const AuthLogo(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 4 / 5,
                  child: const SignupForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
