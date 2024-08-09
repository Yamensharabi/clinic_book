import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final Function validator;
  final String hintText;
  final void Function()? onTap;
  final TextEditingController? controller;
  final bool obscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool multiLines;
  final TextInputType keyboardType;
  final String? label;
  final double? labelPadding;
  final TextDirection? textDirection;
  final double? suffixPadding;
  final Color? fillColor;
  final double? defaultPadding;
  final bool isRequired;
  final int? maxLength;
  final String? helperText;
  final Function(String value)? onChange;
  final Color? hintColor;
  final Color? labelColor;
  const CustomTextFormField(
      {super.key,
      required this.validator,
      required this.hintText,
      this.isRequired = false,
      this.suffixPadding,
      this.prefixIcon,
      this.obscure = false,
      this.multiLines = false,
      this.controller,
      this.defaultPadding,
      this.keyboardType = TextInputType.text,
      this.onTap,
      this.suffixIcon,
      this.label,
      this.textDirection,
      this.labelPadding = 0,
      this.fillColor,
      this.maxLength,
      this.helperText,
      this.onChange,
      this.hintColor,
      this.labelColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: label ?? '',
                style: context.textTheme.bodyMedium!
                    .copyWith(color: labelColor ?? AppColors.grey2),
              ),
              TextSpan(
                text: isRequired ? ' *' : '',
                style: context.textTheme.bodyLarge!.copyWith(
                  color: AppColors.red,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: label != '' ? 5.h : labelPadding,
        ),
        SizedBox(
          child: TextFormField(
            onChanged: helperText != null ? (value) => onChange!(value) : null,
            // inputFormatters: keyboardType != TextInputType.number
            //     ? null
            //     : [
            //         LengthLimitingTextInputFormatter(10),
            //         FilteringTextInputFormatter.digitsOnly,
            //       ],
            keyboardType: keyboardType,
            textDirection: textDirection ?? TextDirection.rtl,
            onTap: onTap,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            maxLength: maxLength,
            maxLengthEnforcement:
                MaxLengthEnforcement.truncateAfterCompositionEnds,
            maxLines: multiLines ? 5 : 1,
            obscureText: obscure,
            controller: controller,
            cursorColor: AppColors.secondaryColor,
            style: context.textTheme.bodyMedium!.copyWith(
                fontSize: 15, color: hintColor ?? AppColors.mainColor),
            validator: (value) => validator(value),
            decoration: InputDecoration(
              helperText: helperText,
              prefixIcon: multiLines
                  ? Container(
                      height: 80,
                      width: 10,
                      alignment: Alignment.topCenter,
                      child: prefixIcon,
                    )
                  : prefixIcon != null
                      ? Padding(
                          padding: const EdgeInsets.all(14),
                          child: prefixIcon,
                        )
                      : null,
              suffixIcon: Padding(
                padding: EdgeInsets.all(suffixPadding ?? 0),
                child: SizedBox(height: 24, width: 24, child: suffixIcon),
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: hintColor ?? AppColors.grey2,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              hintTextDirection: textDirection ?? TextDirection.rtl,
              fillColor: fillColor ?? AppColors.black.withOpacity(.2),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey2),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey2),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        if (maxLength == null) VerticalSizedBox(defaultPadding ?? 12),
      ],
    );
  }
}
