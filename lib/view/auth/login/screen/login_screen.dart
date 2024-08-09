import 'dart:io';

import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/app_bars/custom_appbar.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/logic/controllers/auth/login_controller.dart';
import 'package:clinbook/view/auth/login/widgets/login_containers_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.white,
        body: Column(children: [
          const CustomAppBar(
            text: 'تسجيل الدخول',
          ),
          const VerticalSizedBox(20),
          CustomText(
              text: "مرحبا بك مجدداً\nلنقم بتسجيل الدخول",
              textStyle:
                  TextStyle(color: AppColors.secondaryColor, fontSize: 22)),
          const VerticalSizedBox(20),
          LoginContainersWidget()
        ]));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
