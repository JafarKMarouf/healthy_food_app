import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/constants/app_images.dart';
import 'package:healthyfood/core/functions/custome_shadow.dart';
import 'package:healthyfood/core/shared/custome_text.dart';

class CustomeFails extends StatelessWidget {
  const CustomeFails({super.key, required this.message});
  final dynamic message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: TweenAnimationBuilder(
              duration: AppDuration.showDialog,
              tween: Tween<double>(begin: 0, end: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(AppImages.dialog),
                  const SizedBox(height: 24),
                  const CustomeText(
                    text: 'Sorry!',
                    fontFamily: 'Cabin Medium',
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  CustomeText(
                    text: message.toString(),
                    fontFamily: 'Cabin Medium',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ],
              ),
              builder: (context, value, child) {
                return Container(
                  padding: EdgeInsets.only(top: value),
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
                  child: child,
                );
              }),
        ),
      ),
    );
  }
}
