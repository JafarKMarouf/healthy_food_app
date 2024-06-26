import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';

class CustomeTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType type;
  final bool isSuffix;
  final bool isObscure;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validate;
  final void Function(String)? onChange;
  final String? Function(String?)? onSubmit;
  final VoidCallback? tappedSuffix;

  const CustomeTextFormField({
    super.key,
    required this.type,
    required this.isSuffix,
    this.validate,
    this.controller,
    this.hintText,
    this.prefix,
    this.suffix,
    this.isObscure = false,
    this.tappedSuffix,
    this.onChange,
    this.onSubmit,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      style: const TextStyle(
        color: AppColors.fontColor,
        fontSize: 16,
        fontFamily: 'Cabin Medium',
      ),
      controller: controller,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      validator: validate,
      cursorColor: AppColors.fontColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.fillFormColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 9.5,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hintTextColor,
          fontSize: 16,
          fontFamily: 'Cabin-Medium',
        ),
        border: buildBorder(AppColors.borderColors),
        enabledBorder: buildBorder(AppColors.borderColors),
        focusedBorder: buildBorder(AppColors.borderColors),
        prefixIcon: prefix,
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
