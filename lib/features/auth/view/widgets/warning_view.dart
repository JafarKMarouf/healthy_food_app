import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:healthyfood/core/constant.dart';
import 'package:healthyfood/features/auth/view/verification_view.dart';
import 'package:healthyfood/features/auth/view/widgets/custome_button.dart';

class WarningView extends StatelessWidget {
  const WarningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFDFD).withOpacity(.48),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height / 3.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(.5),
                    spreadRadius: 1,
                    blurRadius: 20,
                    offset: const Offset(1.5, 1.5),
                  ),
                ],
                color: const Color(0xffFFFDFD).withOpacity(.9),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Oh no!',
                        style: TextStyle(
                          fontFamily: 'Montagu Slab',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Something went wrong.',
                        style: TextStyle(
                          fontFamily: 'Montaga',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Please try again.',
                        style: TextStyle(
                          fontFamily: 'Montaga',
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  CustomeButton(
                    title: 'Try again',
                    borderWidth: 0,
                    backgroundColor: const Color(0xff103412),
                    borderColor: const Color(0xffFFFDFD),
                    textColor: const Color(0xffFFFDFD),
                    width: 120,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    onTap: () {
                      g.Get.offAll(
                        () => const VerificationView(),
                        transition: Transition.rightToLeft,
                        duration: kDurationTransition,
                      );
                    },
                  )
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * -.03,
              right: MediaQuery.of(context).size.width / 3,
              child: InkWell(
                onTap: () {
                  g.Get.offAll(
                    () => const VerificationView(),
                    transition: Transition.rightToLeft,
                    duration: kDurationTransition,
                  );
                },
                child: Image.asset(
                  'assets/images/error.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
