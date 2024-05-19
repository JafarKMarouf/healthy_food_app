import 'package:flutter/material.dart';
import 'package:healthyfood/features/auth/view/widgets/signup_form.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.07,
      padding: const EdgeInsets.only(
        top: 45,
        right: 34,
        left: 34,
      ),
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            // width: 262,
            // height: 110,
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          const SignupForm(),
        ],
      ),
    );
  }
}
