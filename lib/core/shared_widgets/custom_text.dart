import 'package:clinbook/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  TextStyle? textStyle;
  final TextAlign? textAlign;
  CustomText({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: textStyle ?? TextStyle(color: Colors.grey, fontSize: 14),
    );
  }
}
