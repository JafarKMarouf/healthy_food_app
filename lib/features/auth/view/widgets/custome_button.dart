import 'package:flutter/material.dart';
import 'package:healthyfood/core/constant.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color borderColor;
  final double width;
  final double borderWidth;
  const CustomeButton({
    super.key,
    required this.title,
    this.onTap,
    required this.borderWidth ,
    required this.backgroundColor ,
    required this.borderColor,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        // height: 38,
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
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Montaga',
            fontWeight: FontWeight.w500,
            color: kFontColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
