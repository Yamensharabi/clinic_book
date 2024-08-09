import 'package:clinbook/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 0, right: 0, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.mainColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        Text(
          text,
          style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(),
      ]),
    );
  }
}
