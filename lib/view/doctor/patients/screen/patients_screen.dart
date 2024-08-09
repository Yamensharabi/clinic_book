import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/horizontal_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:flutter/material.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        textStyle: TextStyle(color: AppColors.thirdColor)),
                  ],
                ),
                const VerticalSizedBox(20),
                CustomText(
                  text: "المرضى",
                  textStyle:
                      TextStyle(color: AppColors.mainColor, fontSize: 24),
                ),
                const VerticalSizedBox(20),
                ListView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.grey2,
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "اسم المريض",
                                      textStyle: TextStyle(
                                          color: AppColors.secondaryColor),
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: "60 عام",
                                        ),
                                        CustomText(
                                          text: "67 KG",
                                        ),
                                        CustomText(
                                          text: "ذكر",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.mainColor),
                                ),
                              ]),
                        ),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
