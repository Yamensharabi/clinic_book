import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/buttons/custom_button.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:clinbook/logic/controllers/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginContainersWidget extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginContainersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.grey2,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100), topRight: Radius.circular(100))),
      child: Container(
        margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(80), topRight: Radius.circular(80))),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // LoginFormsWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    label: "البريد الإلكتروني",
                    validator: () {},
                    controller: loginController.userNameController,
                    hintText: 'Email',
                  ),
                  CustomTextFormField(
                    label: "كلمة المرور",
                    validator: () {},
                    controller: loginController.passwordController,
                    hintText: 'كلمة المرور',
                    obscure: true,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      CustomText(
                        text: 'هل نسيت كلمة المرور؟',
                        textStyle: TextStyle(
                          color: AppColors.orange,
                          decorationColor: AppColors.orange,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              //   LoginButtonsWidgets()

              Column(
                children: [
                  CustomButton(
                    backgroundColor: AppColors.white,
                    onPressed: () {
                      print("Login Function");
                      loginController.login();
                    },
                    widget: CustomText(
                        text: "تسجيل الدخول",
                        textStyle: TextStyle(
                            color: AppColors.mainColor, fontSize: 20)),
                  ),
                  const VerticalSizedBox(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "ليس لديك حساب؟",
                        textStyle: TextStyle(color: AppColors.grey2),
                      ),
                      CustomText(
                        text: " إنشاء حساب",
                        textStyle: TextStyle(
                            decorationColor: AppColors.orange,
                            color: AppColors.orange,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
