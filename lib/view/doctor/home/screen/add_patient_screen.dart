import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_svgs.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:clinbook/logic/controllers/doctor/add_patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddPatientScreen extends StatelessWidget {
  AddPatientScreen({super.key});

  final AddPatientController controller = Get.put(AddPatientController());

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
                text: 'إضافة مريض جديد',
                textStyle: TextStyle(color: AppColors.thirdColor, fontSize: 18),
              ),
              VerticalSizedBox(20),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: () {},
                labelColor: AppColors.mainColor,
                hintText: "الاسم الكامل",
                label: "الاسم الكامل",
                suffixIcon: SvgPicture.asset(AppSvgs.person),
              ),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: () {},
                labelColor: AppColors.mainColor,
                hintText: "العمر",
                label: "العمر",
                suffixIcon: SvgPicture.asset(AppSvgs.person),
              ),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: () {},
                labelColor: AppColors.mainColor,
                hintText: "الوزن",
                label: "الوزن",
                suffixIcon: SvgPicture.asset(AppSvgs.person),
              ),
              CustomTextFormField(
                hintColor: AppColors.mainColor,
                validator: () {},
                labelColor: AppColors.mainColor,
                hintText: "الطول",
                label: "الطول",
                suffixIcon: SvgPicture.asset(AppSvgs.person),
              ),
              VerticalSizedBox(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'أرقام الهواتف',
                    textStyle:
                        TextStyle(color: AppColors.thirdColor, fontSize: 18),
                  ),
                  Obx(() => Column(
                        children: controller.phoneFields
                            .map((field) => field)
                            .toList(),
                      )),
                  TextButton(
                    onPressed: controller.addPhoneField,
                    child: Text('إضافة رقم هاتف'),
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
