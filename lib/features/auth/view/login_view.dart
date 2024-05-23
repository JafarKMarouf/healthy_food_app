import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/shared/custome_button.dart';
import 'package:healthyfood/features/auth/controller/logincontroller.dart';
import 'package:healthyfood/features/auth/view/widgets/auth_logo.dart';
import 'package:healthyfood/features/auth/view/widgets/login_form.dart';
import 'package:healthyfood/features/auth/view/widgets/row_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    LoginControllerImp loginController = Get.put(LoginControllerImp());
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1.08,
        padding: const EdgeInsets.only(top: 45),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const AuthLogo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                children: [
                  const LoginForm(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .005,
                  ),
                  const RowLogin(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .16,
                  ),
                  CustomeButton(
                    textColor: AppColors.fontColor,
                    title: 'Create new account',
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      loginController.goToSignup();
                    },
                    backgroundColor: AppColors.fillFormColor,
                    borderColor: AppColors.borderColors,
                    borderWidth: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
