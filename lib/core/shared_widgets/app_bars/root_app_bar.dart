import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/horizontal_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootAppBar extends StatelessWidget {
  const RootAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
            text: 'ClinBook',
            textStyle: context.textTheme.titleLarge!
                .copyWith(color: AppColors.secondaryColor)),
        const HorizantalSizedBox(4),
        Container(
          height: 22,
          width: 8,
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4))),
        ),
      ],
    );
  }
}
