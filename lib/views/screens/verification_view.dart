import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/shared/custome_text.dart';
import 'package:healthyfood/controllers/auth/verify_controller.dart';
import 'package:healthyfood/core/utils/api_services.dart';
import 'package:healthyfood/data/repos/auth_repo_impl.dart';
import 'package:healthyfood/views/widgets/auth/otp_form.dart';
import 'package:healthyfood/views/widgets/auth/verification_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyControllerImp controller = Get.put(VerifyControllerImp(
        authRepoImpl: AuthRepoImpl(apiServices: ApiServices(Dio()))));

    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          color: AppColors.fontColor,
          inAsyncCall: controller.loading.value,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
                const VerificationBar(),
                const Spacer(flex: 1),
                const OtpForm(),
                const SizedBox(height: 16),
                controller.timer.value == 0 || controller.timer.value == 120
                    ? const SizedBox(height: 12)
                    : Center(
                        child: CustomeText(
                          text: '${controller.timer.value} s',
                          fontSize: 17,
                          fontFamily: 'Montaga',
                        ),
                      ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: controller.timer.value == 0 ||
                          controller.timer.value == 120
                      ? InkWell(
                          onTap: () async {
                            await controller.resend();
                          },
                          splashColor: AppColors.buttonsColor,
                          child: const CustomeText(
                            text: 'Send again',
                            fontSize: 17,
                          ),
                        )
                      : const CustomeText(
                          text: 'Send again',
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                ),
                const Spacer(flex: 4)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
