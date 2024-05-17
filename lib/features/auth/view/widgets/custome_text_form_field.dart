import 'package:flutter/material.dart';
import 'package:healthyfood/core/constant.dart';

class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? customController;
  final String? hintText;
  final TextInputType type;
  final bool isSuffix;
  final bool isObscure;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? Function(String?)? onSubmit;
  final VoidCallback? onPressedSuffix;

  const CustomeTextFormField({
    super.key,
    this.validate,
    this.customController,
    this.hintText,
    this.prefix,
    required this.type,
    required this.isSuffix,
    this.suffix,
    this.isObscure = false,
    this.onPressedSuffix,
    this.onChange,
    this.onSubmit,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      style: const TextStyle(
        color: kFontColor,
      ),
      controller: customController,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      cursorColor: kFontColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: kFillFormColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10.5,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: khintTextColor,
          fontSize: 16,
          fontFamily: 'Cabin-Medium',
        ),
        border: buildBorder(kBorderColors),
        enabledBorder: buildBorder(kBorderColors),
        focusedBorder: buildBorder(kBorderColors),
        prefixIcon: prefix,

        // suffixIcon: suffix,

        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: const Color(0xffB6E5B9),
        // ),

        suffixIcon: suffix,
      ),
    );
  }
}

OutlineInputBorder buildBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: color ?? Colors.white),
  );
}
