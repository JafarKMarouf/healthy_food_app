import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_durations.dart';
import 'package:healthyfood/core/functions/custome_shadow.dart';
import 'package:healthyfood/core/shared/custome_text.dart';

class DialogView extends StatelessWidget {
  const DialogView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    this.text3,
    required this.buttons,
    this.tapImage,
  });
  final String image;
  final String text1;
  final String text2;
  final Widget? text3;
  final Widget buttons;
  final void Function()? tapImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFDFD).withOpacity(.48),
      body: TweenAnimationBuilder(
          duration: AppDuration.showWarning,
          tween: Tween<double>(
            begin: 0,
            end: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CustomeText(
                    text: text1,
                    fontFamily: 'Montagu Slab',
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  CustomeText(
                    text: text2,
                    color: Colors.black,
                  ),
                  text3 == null ? const SizedBox() : text3!
                ],
              ),
              buttons
            ],
          ),
          builder: (context, value, child) {
            return Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: value),
                    width: MediaQuery.of(context).size.width * .85,
                    height: MediaQuery.of(context).size.height / 3.4,
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
                      color: const Color(0xffFFFDFD).withOpacity(.9),
                    ),
                    child: child,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * -.03,
                    right: MediaQuery.of(context).size.width / 3,
                    child: InkWell(
                      onTap: tapImage,
                      child: Image.asset(image),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
