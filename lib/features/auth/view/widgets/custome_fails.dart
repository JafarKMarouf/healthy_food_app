import 'package:flutter/material.dart';
import 'package:healthyfood/core/constant.dart';

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
          BoxShadow(
            color:const Color(0xff000000).withOpacity(.5),
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(1.5, 1.5),
          ),
        ],
        color: const Color(0xffFFFDFD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/dialog.png'),
          const SizedBox(height: 24),
          const Expanded(
            child: Column(
              children: [
                Text(
                  'Sorry!',
                  style: TextStyle(
                    fontFamily: 'Cabin Medium',
                    color: kFontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'Incorrect password or email',
                  style: TextStyle(
                    fontFamily: 'Cabin Medium',
                    color: kFontColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
