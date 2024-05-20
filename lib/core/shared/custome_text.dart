import 'package:flutter/material.dart';
import 'package:healthyfood/core/constants/app_colors.dart';
import 'package:healthyfood/core/constants/app_fonts.dart';

class CustomeText extends StatelessWidget {
  const CustomeText({
    super.key,
    required this.text,
    this.fontSize = 13,
    this.fontFamily = AppFonts.montagaRegular,
    this.color = AppColors.fontColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final double fontSize;
  final String fontFamily;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}
