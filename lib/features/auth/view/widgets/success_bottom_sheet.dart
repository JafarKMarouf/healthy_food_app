import 'package:flutter/material.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';
import 'package:get/get.dart' as g;
import 'package:healthyfood/features/auth/view/widgets/warning_view.dart';
import 'package:healthyfood/features/splash/view/splash_view.dart';

class SuccessBSheet extends StatelessWidget {
  const SuccessBSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[
        Color(0xffB6E5B9),
        Color(0xff82A485),
        Color(0xff657F67),
      ],
    ).createShader(
      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
    );

    return Container(
      padding: EdgeInsets.only(
        top: 8,
        right: MediaQuery.of(context).size.width / 8,
        left: MediaQuery.of(context).size.width / 8,
      ),
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kFillFormColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/close_bottom_sheet.png',
          ),
          const Spacer(flex: 1),
          Image.asset('assets/images/success.png'),
          const Spacer(flex: 1),
          Text(
            'Success!',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cabin',
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          const Spacer(flex: 1),
          const Text(
            'Congratulations! You have been successfully authenticated',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Cabin Medium',
              color: Color(0xffB6B6B6),
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(flex: 1),
          CustomeButton(
            title: 'Continue',
            borderWidth: 0,
            backgroundColor: const Color(0xffB6E5B9),
            borderColor: kBorderColors,
            width: MediaQuery.of(context).size.width * .5,
            textColor: kFontColor,
            onTap: () {
              g.Get.to(
                () => const WarningView(
                  image: 'assets/images/logout.png',
                  text1: 'Oh no! You’re leaving...',
                  text2: 'Are you sure?',
                  buttons: WarningButtons(),
                ),
              );
            },
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

class WarningButtons extends StatelessWidget {
  const WarningButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomeButton(
          title: 'No',
          backgroundColor: const Color(0xffB6E5B9),
          textColor: kFontColor,
          width: MediaQuery.of(context).size.width / 2.8,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          onTap: () {
            g.Get.offAll(
              () => const SplashView(),
              transition: g.Transition.fadeIn,
              duration: kDurationTransition,
            );
          },
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        CustomeButton(
          title: 'Yes,Log Me Out',
          backgroundColor: const Color(0xffB6E5B9),
          textColor: kFontColor,
          width: MediaQuery.of(context).size.width / 2.8,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          onTap: () {
            g.Get.offAll(
              () => const LoginView(),
              transition: g.Transition.rightToLeft,
              duration: kDurationTransition,
            );
          },
        )
      ],
    );
  }
}
