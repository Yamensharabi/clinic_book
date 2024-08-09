import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/buttons/custom_button.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:flutter/material.dart';

class LoginButtonsWidgets extends StatelessWidget {
  const LoginButtonsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          backgroundColor: AppColors.white,
          onPressed: () {},
          widget: CustomText(
              text: "تسجيل الدخول",
              textStyle: TextStyle(color: AppColors.mainColor, fontSize: 20)),
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
              textStyle: TextStyle(decorationColor: AppColors.orange,
                  color: AppColors.orange,
                  decoration: TextDecoration.underline),
            ),
          ],
        )
      ],
    );
  }
}
