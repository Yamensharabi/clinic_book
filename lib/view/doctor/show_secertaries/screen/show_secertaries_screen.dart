import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSecertariesScreen extends StatelessWidget {
  const ShowSecertariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
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
                        textStyle: TextStyle(
                          color: AppColors.thirdColor,
                        )),
                  ],
                ),
                const VerticalSizedBox(20),
                CustomText(
                  text: "السكرتير",
                  textStyle: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                const VerticalSizedBox(20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "الاسم الكامل",
                              textStyle: context.textTheme.bodyMedium!
                                  .copyWith(color: AppColors.grey),
                            ),
                            CustomText(
                              text: "محمود الحسن",
                              textStyle: context.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: "العمر",
                              textStyle: context.textTheme.bodyMedium!
                                  .copyWith(color: AppColors.grey),
                            ),
                            CustomText(
                              text: "34 عام",
                              textStyle: context.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: "اسم المستخدم",
                              textStyle: context.textTheme.bodyMedium!
                                  .copyWith(color: AppColors.grey),
                            ),
                            CustomText(
                              text: "محمود الحسن",
                              textStyle: context.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    VerticalSizedBox(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "الجنس",
                              textStyle: context.textTheme.bodyMedium!
                                  .copyWith(color: AppColors.grey),
                            ),
                            CustomText(
                              text: "ذكر",
                              textStyle: context.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            CustomText(
                              text: "البريد الإلكتروني",
                              textStyle: context.textTheme.bodyMedium!
                                  .copyWith(color: AppColors.grey),
                            ),
                            CustomText(
                              text: "example@example.com",
                              textStyle: context.textTheme.bodyLarge!
                                  .copyWith(color: AppColors.secondaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                VerticalSizedBox(20),
                CustomText(
                  text: "الصلاحيات",
                  textStyle: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
                VerticalSizedBox(20),
                Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: "الصلاحيات",
                          textStyle: TextStyle(
                            color: AppColors.grey,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.radio_button_checked)
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
