import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginFormsWidget extends StatelessWidget {
  const LoginFormsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          label: "البريد الإلكتروني",
          validator: () {},
          hintText: 'Email',
        ),
        CustomTextFormField(
          label: "كلمة المرور",
          validator: () {},
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
    );
  }
}
