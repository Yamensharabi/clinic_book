import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_svgs.dart';
import 'package:clinbook/core/shared_widgets/buttons/custom_button.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:clinbook/logic/controllers/doctor/add_patient_controller.dart';
import 'package:clinbook/logic/controllers/doctor/add_secertary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddSecertaryScreen extends StatelessWidget {
  AddSecertaryScreen({super.key});

  final AddSecertaryController addSecertaryController =
      Get.put(AddSecertaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.mainColor,
                    ),
                  ),
                  CustomText(
                    text: 'ClinBook',
                    textStyle:
                        TextStyle(color: AppColors.thirdColor, fontSize: 22),
                  ),
                  SizedBox(),
                ],
              ),
              VerticalSizedBox(20),
              CustomText(
                text: 'إضافة سكرتير جديد',
                textStyle: TextStyle(color: AppColors.thirdColor, fontSize: 18),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextFormField(
                      label: 'البريد الإلكتروني',
                      validator: () {},
                      hintColor: AppColors.mainColor,
                      labelColor: AppColors.mainColor,
                      hintText: 'ادخل البريد الإلكتروني'),
                  CustomTextFormField(
                      label: 'الاسم الكامل',
                      validator: () {},
                      hintColor: AppColors.mainColor,
                      labelColor: AppColors.mainColor,
                      hintText: 'اسم المستخدم'),
                  CustomTextFormField(
                      label: 'الاسم الأول',
                      validator: () {},
                      hintColor: AppColors.mainColor,
                      labelColor: AppColors.mainColor,
                      hintText: 'الاسم الأول'),
                  CustomTextFormField(
                      label: 'العنوان',
                      validator: () {},
                      hintColor: AppColors.mainColor,
                      labelColor: AppColors.mainColor,
                      hintText: 'ادخل العنوان كامل'),
                  CustomText(
                    text: "الجنس",
                    textStyle: TextStyle(color: AppColors.mainColor),
                  ),
                  VerticalSizedBox(10),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: AppColors.secondaryColor),
                              color:
                                  addSecertaryController.selectedGender.value ==
                                          'ذكر'
                                      ? AppColors.mainColor
                                      : AppColors.grey2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Radio<String>(
                                value: 'ذكر',
                                groupValue:
                                    addSecertaryController.selectedGender.value,
                                onChanged: (value) {
                                  addSecertaryController.selectGender(value!);
                                },
                                activeColor: addSecertaryController
                                            .selectedGender.value ==
                                        'ذكر'
                                    ? AppColors.grey2
                                    : AppColors.mainColor,
                              ),
                              CustomText(
                                  text: "ذكر",
                                  textStyle: TextStyle(
                                      color: addSecertaryController
                                                  .selectedGender.value ==
                                              'ذكر'
                                          ? AppColors.white
                                          : AppColors.mainColor,
                                      fontSize: 18))
                            ],
                          ),
                        ),
                        SizedBox(width: 30.0),
                        Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: AppColors.secondaryColor),
                              color:
                                  addSecertaryController.selectedGender.value ==
                                          'أنثى'
                                      ? AppColors.mainColor
                                      : AppColors.grey2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Radio<String>(
                                value: 'أنثى',
                                groupValue:
                                    addSecertaryController.selectedGender.value,
                                onChanged: (value) {
                                  addSecertaryController.selectGender(value!);
                                },
                                activeColor: addSecertaryController
                                            .selectedGender.value ==
                                        'أنثى'
                                    ? AppColors.grey2
                                    : AppColors.mainColor,
                              ),
                              CustomText(
                                  text: "أنثى",
                                  textStyle: TextStyle(
                                      color: addSecertaryController
                                                  .selectedGender.value ==
                                              'أنثى'
                                          ? AppColors.white
                                          : AppColors.mainColor,
                                      fontSize: 18))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextFormField(
                      label: 'كلمة المرور',
                      validator: () {},
                      hintColor: AppColors.mainColor,
                      labelColor: AppColors.mainColor,
                      hintText: '**********'),
                  CustomTextFormField(
                      label: 'تأكيد كلمة المرور',
                      validator: () {},
                      hintColor: AppColors.mainColor,
                      labelColor: AppColors.mainColor,
                      hintText: "**********"),
                  const VerticalSizedBox(20),
                  CustomButton(
                    // backgroundColor: AppColors.white,
                    onPressed: () {
                      // addSecertaryController.signup();
                    },
                    widget: CustomText(
                        text: 'إضافة السكرتير',
                        textStyle:
                            TextStyle(color: AppColors.white, fontSize: 20)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
