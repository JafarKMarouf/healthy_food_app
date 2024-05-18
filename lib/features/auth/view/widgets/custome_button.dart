import 'package:flutter/material.dart';

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
    required this.borderWidth,
    required this.backgroundColor,
    required this.borderColor,
    required this.width,
    required this.textColor,
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
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
