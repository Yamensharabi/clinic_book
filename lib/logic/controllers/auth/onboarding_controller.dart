import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  int currentIndex = 0;
  late PageController pageController;

  void nextPage() {
    if (currentIndex < 3) {
      print(currentIndex);
      currentIndex++;
      print(currentIndex);

      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
      update();
    }
  }

  void onChanged(int index) {
    currentIndex = index;
    update();
  }

  void previousPage() {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
      update();
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
