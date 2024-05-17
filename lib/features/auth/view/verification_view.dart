import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthyfood/features/auth/view/widgets/verification_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: const VerificationBody(),
    );
  }
}
