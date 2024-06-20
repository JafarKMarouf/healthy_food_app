import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/shared/custome_text.dart';
import 'package:healthyfood/controllers/auth/verify_controller.dart';
import 'package:healthyfood/views/widgets/auth/otp_form.dart';
import 'package:healthyfood/views/widgets/auth/verification_bar.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyControllerImp controller = Get.put(VerifyControllerImp());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerificationBar(),
            const Spacer(flex: 1),
            const OtpForm(),
            const SizedBox(height: 16),
            const Center(
              child: CustomeText(
                text: '03 : 00 s',
                fontSize: 17,
                fontFamily: 'Montaga',
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                controller.resend();
                controller.showWarning();
              },
              child: const CustomeText(
                text: 'Send again',
                fontSize: 17,
              ),
            ),
            const Spacer(flex: 4)
          ],
        ),
      ),
    );
  }
}
