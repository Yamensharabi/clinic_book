import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/logic/controllers/auth/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({
    super.key,
    required OnboardingController controller,
    required this.images,
  }) : _controller = controller;

  final OnboardingController _controller;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _controller.pageController,
      count: images.length,
      axisDirection: Axis.horizontal,
      effect: WormEffect(
        activeDotColor: AppColors.secondaryColor,
        paintStyle: PaintingStyle.fill,
        dotColor: AppColors.white,
        radius: 3,
        spacing: 10,
        dotHeight: 5,
        type: WormType.normal,
        dotWidth: 20,
      ),
    );
  }
}
