import 'package:flutter/material.dart';
import 'package:healthyfood/core/shared/custome_text_form_field.dart';


class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomeTextFormField(type: TextInputType.text, isSuffix: false),
          ],
        ),
      ),
    );
  }
}
