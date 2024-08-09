import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_svgs.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddPatientController extends GetxController {
  var phoneFields = <Widget>[].obs;

  void addPhoneField() {
    phoneFields.add(CustomTextFormField(
      hintColor: AppColors.mainColor,
      validator: () {},
      hintText: "رقم الهاتف",
      suffixIcon: SvgPicture.asset(AppSvgs.person),
    ));
  }
}
