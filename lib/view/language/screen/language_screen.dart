import 'dart:ui';

import 'package:clinbook/constants/app_routes.dart';
import 'package:clinbook/core/localization/change_locale.dart';
import 'package:clinbook/view/language/widgets/choose_language_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class LanguageScreen extends GetView<LocaleController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1".tr, style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 20),
              ChooseLanguageButtonWidget(
                  textButton: "Ar",
                  onPressed: () {
                    controller.changeLang("ar");
                    // Get.toNamed(AppRoutes.onboardingScreen);
                  }),
              ChooseLanguageButtonWidget(
                  textButton: "En",
                  onPressed: () {
                    controller.changeLang("en");
                    //   Get.toNamed(AppRoutes.onboardingScreen);
                    print(controller.language);
                  }),
            ],
          )),
    );
  }
}
