import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/buttons/custom_button.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/horizontal_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentsDetailsScreen extends StatelessWidget {
  const AppointmentsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.mainColor),
                      ),
                      CustomText(
                          text: 'ClinBook',
                          textStyle: TextStyle(color: AppColors.thirdColor)),
                    ],
                  ),
                  const VerticalSizedBox(20),
                  Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: CustomText(
                        text: "موعد محجوز",
                        textStyle: context.textTheme.bodyLarge!
                            .copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  const VerticalSizedBox(20),
                  CustomText(
                      text: 'تفاصيل الموعد',
                      textStyle:
                          TextStyle(color: AppColors.thirdColor, fontSize: 20)),
                  const Divider(),
                  const VerticalSizedBox(20),
                  Column(
                    children: [
                      Row(
                        children: [
                          CustomText(text: "تاريخ الموعد:"),
                          const Spacer(),
                          CustomText(
                            text: "25/12/2024",
                            textStyle: context.textTheme.bodyLarge!
                                .copyWith(color: AppColors.mainColor),
                          ),
                        ],
                      ),
                      const VerticalSizedBox(10),
                      Row(
                        children: [
                          CustomText(text: "الساعة:"),
                          const Spacer(),
                          CustomText(
                            text: "10:15 ص",
                            textStyle: context.textTheme.bodyLarge!
                                .copyWith(color: AppColors.mainColor),
                          ),
                        ],
                      ),
                      const VerticalSizedBox(10),
                      Row(
                        children: [
                          CustomText(text: "اسم المريض:"),
                          const Spacer(),
                          CustomText(
                            text: "محمد الحسن",
                            textStyle: context.textTheme.bodyLarge!
                                .copyWith(color: AppColors.mainColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const VerticalSizedBox(60),
                  CustomButton(
                    widget: CustomText(
                      text: 'إلغاء الحجز',
                      textStyle: context.textTheme.bodyLarge,
                    ),
                    backgroundColor: AppColors.red,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
