import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/functions/custome_shadow.dart';
import 'package:healthyfood/core/shared/custome_text.dart';

class CustomeFails extends StatelessWidget {
  const CustomeFails({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width * 3,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          customeShadow(
            color: AppColors.black.withOpacity(.5),
            spread: 1,
            blur: 20,
            offset: const Offset(1.5, 1.5),
          ),
        ],
        color: const Color(0xffFFFDFD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppImages.dialog),
          const SizedBox(height: 24),
          const Expanded(
            child: Column(
              children: [
                CustomeText(
                  text: 'Sorry!',
                  fontFamily: 'Cabin Medium',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                CustomeText(
                  text: 'Incorrect password or email',
                  fontFamily: 'Cabin Medium',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}