import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/login_view.dart';
import 'package:healthyfood/features/auth/view/signup_view.dart';
import 'package:healthyfood/features/auth/view/verification_view.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';
import 'package:healthyfood/features/auth/view/widgets/warning_view.dart';
import 'package:healthyfood/features/splash/view/splash_view.dart';

void main() {
  runApp(const HealthyFood());
}

class HealthyFood extends StatelessWidget {
  const HealthyFood({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montaga',
      ),

      // home: WarningView(
      //   image: 'assets/images/logout.png',
      //   text1: 'Oh no! You’re leaving...',
      //   text2: 'Are you sure?',
      //   widget: Column(
      //     children: [
      //       CustomeButton(
      //         title: 'No',
      //         backgroundColor: const Color(0xffB6E5B9),
      //         textColor: kFontColor,
      //         width: MediaQuery.of(context).size.width / 2.8,
      //         fontSize: 12,
      //         fontWeight: FontWeight.normal,
      //         onTap: () {
      //           Get.offAll(
      //             () => const LoginView(),
      //             transition: Transition.rightToLeft,
      //             duration: kDurationTransition,
      //           );
      //         },
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * .02,
      //       ),
      //       CustomeButton(
      //         title: 'Yes,Log Me Out',
      //         backgroundColor: const Color(0xffB6E5B9),
      //         textColor: kFontColor,
      //         width: MediaQuery.of(context).size.width / 2.8,
      //         fontSize: 12,
      //         fontWeight: FontWeight.normal,
      //         onTap: () {
      //           Get.offAll(
      //             () => const LoginView(),
      //             transition: Transition.rightToLeft,
      //             duration: kDurationTransition,
      //           );
      //         },
      //       )
      //     ],
      //   ),
      // ),

      home: const SplashView(),
    );
  }
}
