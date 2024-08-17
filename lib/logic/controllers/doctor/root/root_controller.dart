import 'package:clinbook/constants/app_routes.dart';
import 'package:clinbook/view/doctor/patients/screen/patients_screen.dart';
import 'package:clinbook/view/doctor/show_secertaries/screen/show_secertaries_screen.dart';
import 'package:clinbook/view/home/screen/home_screen.dart';
import 'package:clinbook/view/language/screen/language_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
//----------------------------------------------------------------

  int currentPage = 4;

  List<Widget> pageList = [
    const ShowSecertariesScreen(),
    const LanguageScreen(),
    const Text(''),
    PatientsScreen(),
    const HomeScreen(),
  ];

  @override
  selectedPage(int index) {
    if (index == 0) {
      Get.to(() => ShowSecertariesScreen());
    }
    if (index == 1) {
      Get.to(() => LanguageScreen());
    }
    if (index == 2) {
      index = 4;
    }

    if (index == 3) {
      Get.to(() => PatientsScreen());
    }
    if (index == 4) {
      Get.to(() => HomeScreen());
    }

    currentPage = index;
    update();
  }
}
