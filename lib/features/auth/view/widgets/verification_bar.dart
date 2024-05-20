import 'package:flutter/material.dart';
import 'package:healthyfood/core/shared/custome_text.dart';
import 'package:healthyfood/features/auth/view/widgets/auth_logo.dart';

class VerificationBar extends StatelessWidget {
  const VerificationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            width: 270,
            height: 100,
            child: AuthLogo(),
          ),
        ),
        SizedBox(height: 8),
        CustomeText(
          text: 'Verification Code',
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 8),
        SizedBox(
          width: 300,
          child: CustomeText(
            text: 'We have sent the verification code to your email address',
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'Montaga',
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
