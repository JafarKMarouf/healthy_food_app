import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/widgets/opt_form.dart';
import 'package:healthyfood/features/auth/view/widgets/warning_view.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 270,
                  height: 100,
                  child: Image.asset(
                    'assets/images/image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Verification Code',
                style: TextStyle(
                  fontFamily: 'Montaga',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: kFontColor,
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(
                width: 300,
                child: Text(
                  'We have sent the verification code to your email address',
                  style: TextStyle(
                    fontFamily: 'Montaga',
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 1),
          const OtpForm(),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              '03 : 00 s',
              style: TextStyle(
                color: kFontColor,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Get.to(
                () => const WarningView(),
              );
            },
            child: const Text(
              'Send again',
              style: TextStyle(
                color: kFontColor,
                fontSize: 17,
              ),
            ),
          ),
          const Spacer(flex: 4)
        ],
      ),
    );
  }
}
