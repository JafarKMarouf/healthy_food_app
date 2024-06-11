import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';

class CertificateFile extends StatelessWidget {
  const CertificateFile({
    super.key,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xffD7DDDB),
        ),
        color: const Color(0xffFAFFF8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Certificate PDF file',
            style: TextStyle(
              fontFamily: 'Cabin Medium',
              color: AppColors.hintTextColor,
            ),
          ),
          const SizedBox(width: 8),
          Image.asset(
            AppImages.upload,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
    );
  }
}
