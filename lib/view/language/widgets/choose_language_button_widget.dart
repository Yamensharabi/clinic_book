import 'package:clinbook/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ChooseLanguageButtonWidget extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const ChooseLanguageButtonWidget(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: MaterialButton(
          color: AppColors.mainColor,
          onPressed: onPressed,
          child: Text(
            textButton,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: AppColors.white),
          ),
        ));
  }
}
