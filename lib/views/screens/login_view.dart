import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/controllers/auth/login_controller.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/auth_logo.dart';
import 'package:healthyfood/views/widgets/auth/login_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginControllerImp = Get.put(LoginControllerImp(
        authRepoImpl: AuthRepoImpl(apiServices: ApiServices(Dio()))));

    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          color: AppColors.fontColor,
          inAsyncCall: loginControllerImp.loading.value,
          child: Container(
            height: MediaQuery.of(context).size.height * .96,
            padding: const EdgeInsets.only(top: 35, right: 34, left: 34),
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1.2 / 4,
                  child: const AuthLogo(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 2 / 4,
                  child: const LoginForm(),
                ),
                CustomeButton(
                  textColor: AppColors.fontColor,
                  title: 'Create new account',
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    loginControllerImp.goToSignup();
                  },
                  backgroundColor: AppColors.fillFormColor,
                  borderColor: AppColors.borderColors,
                  borderWidth: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
