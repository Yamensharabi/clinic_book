import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_svgs.dart';
import 'package:clinbook/core/shared_widgets/app_bars/custom_appbar.dart';
import 'package:clinbook/core/shared_widgets/buttons/custom_button.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:clinbook/logic/controllers/auth/signup_controller.dart';
import 'package:clinbook/view/auth/login/widgets/login_forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(children: [
          const CustomAppBar(text: 'إنشاء حساب'),
          CustomText(
            text: "لنقم بإنشاء حساب جديد",
            textStyle: context.textTheme.bodyLarge!
                .copyWith(color: AppColors.secondaryColor),
          ),
          /*  Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey2,
                    border: Border.all(color: AppColors.mainColor)),
                child: SvgPicture.asset(
                  AppSvgs.person,
                  color: AppColors.mainColor,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: SvgPicture.asset(AppSvgs.cameraIcon),
                  ))
            ],
          ), */
          const VerticalSizedBox(20),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.grey2,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
            child: Container(
              margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextFormField(
                            label: 'البريد الإلكتروني',
                            controller: signupController.emailController,
                            hintColor: AppColors.white,
                            validator: () {},
                            hintText: 'ادخل البريد الإلكتروني'),
                        CustomTextFormField(
                            label: 'اسم المستخدم',
                            controller: signupController.userNameController,
                            hintColor: AppColors.white,
                            validator: () {},
                            hintText: 'اسم المستخدم'),
                        CustomTextFormField(
                            label: 'الاسم الأول',
                            controller: signupController.firstNameController,
                            hintColor: AppColors.white,
                            validator: () {},
                            hintText: 'الاسم الأول'),
                        CustomTextFormField(
                            label: 'العنوان',
                            hintColor: AppColors.white,
                            validator: () {},
                            hintText: 'ادخل العنوان كامل'),
                        CustomText(
                          text: "الجنس",
                          textStyle: TextStyle(color: AppColors.grey2),
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
                                    border: Border.all(
                                        color: AppColors.secondaryColor),
                                    color:
                                        signupController.selectedGender.value ==
                                                'ذكر'
                                            ? AppColors.black.withOpacity(.5)
                                            : AppColors.mainColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Radio<String>(
                                      value: 'ذكر',
                                      groupValue:
                                          signupController.selectedGender.value,
                                      onChanged: (value) {
                                        signupController.selectGender(value!);
                                      },
                                      activeColor: signupController
                                                  .selectedGender.value ==
                                              'ذكر'
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    CustomText(
                                        text: "ذكر",
                                        textStyle: TextStyle(
                                            color: AppColors.white,
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
                                    border: Border.all(
                                        color: AppColors.secondaryColor),
                                    color:
                                        signupController.selectedGender.value ==
                                                'أنثى'
                                            ? AppColors.black.withOpacity(.5)
                                            : AppColors.mainColor),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Radio<String>(
                                      value: 'أنثى',
                                      groupValue:
                                          signupController.selectedGender.value,
                                      onChanged: (value) {
                                        signupController.selectGender(value!);
                                      },
                                      activeColor: signupController
                                                  .selectedGender.value ==
                                              'أنثى'
                                          ? Colors.blue
                                          : Colors.grey,
                                    ),
                                    CustomText(
                                        text: "أنثى",
                                        textStyle: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 18))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextFormField(
                            label: 'كلمة المرور',
                            hintColor: AppColors.white,
                            validator: () {},
                            controller: signupController.passwordController,
                            hintText: '**********'),
                        CustomTextFormField(
                            label: 'تأكيد كلمة المرور',
                            hintColor: AppColors.white,
                            validator: () {},
                            controller:
                                signupController.confirmPasswordController,
                            hintText: "**********"),
                        const VerticalSizedBox(20),
                        CustomButton(
                          backgroundColor: AppColors.white,
                          onPressed: () {
                            signupController.signup();
                          },
                          widget: CustomText(
                              text: "إنشاء حساب",
                              textStyle: TextStyle(
                                  color: AppColors.mainColor, fontSize: 20)),
                        ),
                        const VerticalSizedBox(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "لديك حساب بالفعل؟",
                              textStyle: TextStyle(color: AppColors.grey2),
                            ),
                            CustomText(
                              text: "تسجيل الدخول",
                              textStyle: TextStyle(
                                  decorationColor: AppColors.orange,
                                  color: AppColors.orange,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ))
        ]));
  }
}
