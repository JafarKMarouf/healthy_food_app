import 'package:flutter/material.dart';
import 'package:healthyfood/core/shared/custome_text.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double width;
  final double borderWidth;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  const CustomeButton({
    super.key,
    required this.title,
    this.onTap,
    this.borderWidth = 0,
    this.backgroundColor = const Color(0xff103412),
    this.borderColor = const Color(0xffFFFDFD),
    required this.width,
    this.textColor = const Color(0xffFFFDFD),
    this.fontSize = 16,
    this.fontFamily = 'Montaga',
    this.fontWeight = FontWeight.normal,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: CustomeText(
          text: title,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: textColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
