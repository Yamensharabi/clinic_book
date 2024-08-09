import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_images.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/logic/controllers/auth/onboarding_controller.dart';
import 'package:clinbook/view/auth/onboarding/widgets/page_view_builder_widget.dart';
import 'package:clinbook/view/auth/onboarding/widgets/skip_button_widget.dart';
import 'package:clinbook/view/auth/onboarding/widgets/smooth_page_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController _controller = Get.put(OnboardingController());
  // final PageController pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  SkipButtonWidget(controller: _controller, images: images),
                  Expanded(
                    child: PageViewBuilderWidget(
                        images: images, controller: _controller),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                SmoothPageIndicatorWidget(
                    controller: _controller, images: images),
                GetBuilder<OnboardingController>(builder: (_) {
                  if (_controller.currentIndex == 0) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: _controller.nextPage,
                          child: Container(
                            height: 50.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomLeft: Radius.circular(40),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: "التالي",
                                textStyle: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else if (_controller.currentIndex == images.length - 1) {
                    return Container(
                      height: 50.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Handle "Start Now" button tap
                        },
                        child: Center(
                          child: CustomText(
                            text: "ابدأ الآن",
                            textStyle: TextStyle(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Row(children: [
                      InkWell(
                        onTap: _controller.nextPage,
                        child: Container(
                          height: 50.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: "التالي",
                              textStyle: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: _controller.previousPage,
                        child: Container(
                            height: 50.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                            ),
                            child: Center(
                                child: CustomText(
                              text: "السابق",
                              textStyle: TextStyle(
                                color: AppColors.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ))),
                      )
                    ]);
                  }
                })
              ]))
        ]));
  }

  List<String> images = [
    AppImages.onboarding1,
    AppImages.onboarding2,
    AppImages.onboarding3,
    AppImages.onboarding4,
  ];
}
