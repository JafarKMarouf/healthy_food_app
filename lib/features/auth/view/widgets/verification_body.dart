import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:healthyfood/core/constant.dart';

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
                  height: 130,
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
          Form(
            child: OtpTextField(
              focusedBorderColor: const Color(0xff757575),
              numberOfFields: 6,
              fieldWidth: 50,
              fieldHeight: 60,
              borderRadius: BorderRadius.circular(50),
              showFieldAsBox: true,
              borderWidth: 2,
              cursorColor: kFontColor,
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Color(0xff757575),
              ),
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
          ),
          const SizedBox(height: 18),
          const Center(
            child: Text(
              '03 : 00',
              style: TextStyle(
                color: kFontColor,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {},
            child: const Text(
              'Send again',
              style: TextStyle(
                color: kFontColor,
                fontSize: 17,
              ),
            ),
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
