import 'package:flutter/material.dart';

class WarningView extends StatelessWidget {
  const WarningView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    this.text,
    required this.buttons,
  });
  final String image;
  final String text1;
  final String text2;
  final Widget? text;
  final Widget buttons;

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
                  Column(
                    children: [
                      Text(
                        text1,
                        style: const TextStyle(
                          fontFamily: 'Montagu Slab',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        text2,
                        style: const TextStyle(
                          fontFamily: 'Montaga',
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      text == null ? const SizedBox() : text!
                    ],
                  ),
                  buttons
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * -.03,
              right: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
