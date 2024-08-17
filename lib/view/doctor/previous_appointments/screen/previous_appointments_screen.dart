import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/horizontal_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:flutter/material.dart';

class PreviousAppointmentsScreen extends StatelessWidget {
  const PreviousAppointmentsScreen({super.key});

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
                  Center(
                    child: CustomText(
                      text: "المواعيد سابقة",
                      textStyle:
                          TextStyle(color: AppColors.mainColor, fontSize: 24),
                    ),
                  ),
                  const VerticalSizedBox(20),
                  CustomText(
                      text: 'قائمة المواعيد',
                      textStyle:
                          TextStyle(color: AppColors.thirdColor, fontSize: 20)),
                  const VerticalSizedBox(20),
                  Center(
                    child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            color: AppColors.grey2,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.mainColor)),
                        child: Center(
                            child: CustomText(
                          text: "12/12/2024",
                          textStyle: TextStyle(color: AppColors.grey),
                        ))),
                  ),
                  const VerticalSizedBox(20),
                  ListView.builder(
                      itemCount: 2,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.schedule),
                                  const HorizantalSizedBox(10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: "8:00",
                                        textStyle: TextStyle(),
                                      ),
                                      CustomText(
                                        text: "محمد الحسن",
                                        textStyle: TextStyle(),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        );
                      })
                ],
              ),
            )
          ],
        ));
  }
}
