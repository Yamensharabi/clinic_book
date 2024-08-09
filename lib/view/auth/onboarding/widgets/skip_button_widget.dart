import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/logic/controllers/auth/onboarding_controller.dart';
import 'package:flutter/material.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({
    super.key,
    required OnboardingController controller,
    required this.images,
  }) : _controller = controller;

  final OnboardingController _controller;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _controller.currentIndex = images.length - 1;
              _controller.pageController.animateToPage(_controller.currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn);
              _controller.update();
            },
            child: CustomText(
              text: 'تخطي',
              textStyle: TextStyle(color: AppColors.mainColor),
            ),
          )
        ],
      ),
    );
  }
}
