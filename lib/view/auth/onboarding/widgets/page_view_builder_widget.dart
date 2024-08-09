import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/logic/controllers/auth/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewBuilderWidget extends StatelessWidget {
  const PageViewBuilderWidget({
    super.key,
    required this.images,
    required OnboardingController controller,
  }) : _controller = controller;

  final List<String> images;
  final OnboardingController _controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      controller: _controller.pageController,
      onPageChanged: (index) {
        _controller.onChanged(index);
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: GetBuilder<OnboardingController>(builder: (_) {
                    return Image.asset(
                      fit: BoxFit.fill,
                      images[_controller.currentIndex],
                    );
                  }),
                ),
              ),
              const VerticalSizedBox(20),
              CustomText(
                text: "الآن بكل سهولة وسرعة\n!وأمان عالي",
                textStyle: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSizedBox(20),
              CustomText(
                text:
                    "احجز موعد عند طبيبك دون الحاجة\nللاتصال أو زيارة مكان العيادة\nمع دقة عالية بالمواعيد لتوفير الوقت",
                textStyle: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
