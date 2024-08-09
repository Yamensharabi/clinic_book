import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Center(
                child: Image.asset(
              AppImages.logo,
              fit: BoxFit.fill,
              height: 250.h,
              width: 250.w,
            )),
            Text(
              "ClinBook",
              style: TextStyle(color: AppColors.thirdColor, fontSize: 32.r),
            )
          ],
        ));
  }
}
