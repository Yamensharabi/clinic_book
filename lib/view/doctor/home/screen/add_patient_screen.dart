import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/app_bars/root_app_bar.dart';
import 'package:clinbook/core/shared_widgets/buttons/custom_button.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:clinbook/logic/controllers/doctor/add_patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPatientScreen extends StatelessWidget {
  AddPatientScreen({super.key});

  final AddPatientController controller = Get.put(AddPatientController());
  final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJkb2N0b3IyQGNsaW5pYy5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc5ZWU3NDk4LTc1MzgtNDdjMS04NzlmLTQxOGQ2MDI3OTFjNSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyJHZXREb2N0b3JQYXRpZW50cyIsIkdldERvY3RvckFwcG9pbnRtZW50cyIsIkdldENsaW5pY1dvcmtIb3VycyIsIkRvY3RvciIsIkFkZERvY3RvclBhdGllbnQiLCJVcGRhdGVXb3JrSG91cnMiXSwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwOS8wOS9pZGVudGl0eS9jbGFpbXMvYWN0b3IiOiJEb2N0b3IiLCJleHAiOjE3MjU4Mjc4OTUsImlzcyI6Imh0dHBzOi8vMTU0LjEyLjIzMC44OjkwMSIsImF1ZCI6Imh0dHBzOi8vMTU0LjEyLjIzMC44OjkwMSJ9.MYtwiEIxbU66Kmy9dzJsqlhZBYBy-ZcKS9Xj0XVgDK0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RootAppBar(),
              const VerticalSizedBox(20),
              CustomText(
                text: 'إضافة مريض جديد',
                textStyle:
                    TextStyle(color: AppColors.secondaryColor, fontSize: 18),
              ),
              const VerticalSizedBox(20),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: (value) => controller.validateField(value),
                labelColor: AppColors.mainColor,
                hintText: "الاسم الكامل",
                fillColor: AppColors.grey2,
                label: "الاسم الكامل",
                suffixIcon: const Icon(Icons.person),
                controller: controller.fullNameController,
              ),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: (value) => controller.validateField(value),
                labelColor: AppColors.mainColor,
                hintText: "العمر",
                fillColor: AppColors.grey2,
                label: "العمر",
                suffixIcon: const Icon(Icons.date_range),
                controller: controller.birthDateController,
              ),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: (value) => controller.validateField(value),
                labelColor: AppColors.mainColor,
                hintText: "الوزن",
                fillColor: AppColors.grey2,
                label: "الوزن",
                suffixIcon: const Icon(Icons.personal_video_rounded),
                controller: controller.weightController,
              ),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: (value) => controller.validateField(value),
                labelColor: AppColors.mainColor,
                hintText: "الطول",
                fillColor: AppColors.grey2,
                label: "الطول",
                suffixIcon: const Icon(Icons.height),
                controller: controller.tallController,
              ),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: (value) => controller.validateField(value),
                labelColor: AppColors.mainColor,
                fillColor: AppColors.grey2,
                hintText: "مصدر الحساب",
                label: "مصدر الحساب",
                controller: controller.referencePatientAccountIdController,
              ),
              const VerticalSizedBox(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'أرقام الهواتف',
                    textStyle: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 18),
                  ),
                  const VerticalSizedBox(5),
                  Obx(() => Column(
                        children: controller.phoneControllers
                            .map((field) => Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CustomTextFormField(
                                    hintColor: AppColors.mainColor,
                                    labelColor: AppColors.mainColor,
                                    hintText: "رقم الهاتف",
                                    label: "رقم الهاتف",
                                    fillColor: AppColors.grey2,
                                    controller: field,
                                    validator: () {},
                                  ),
                                ))
                            .toList(),
                      )),
                  const VerticalSizedBox(5),
                  InkWell(
                    onTap: controller.addPhoneField,
                    child: Row(
                      children: [
                        Icon(Icons.add, color: AppColors.mainColor),
                        CustomText(
                          text: 'إضافة رقم هاتف',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const VerticalSizedBox(16),
              CustomButton(
                  backgroundColor: AppColors.mainColor,
                  onPressed: () =>
                      controller.addPatient(token), // استخدام دالة الإضافة هنا
                  widget: CustomText(
                    text: "إضافة",
                    textStyle: context.textTheme.bodyLarge,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
