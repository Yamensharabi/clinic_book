import 'dart:convert';

import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_svgs.dart';
import 'package:clinbook/core/shared_widgets/text_fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class AddPatientController extends GetxController {
  var phoneFields = <Widget>[].obs;

  void addNewPhoneField() {
    phoneFields.add(CustomTextFormField(
      hintColor: AppColors.mainColor,
      validator: () {},
      hintText: "رقم الهاتف",
      suffixIcon: Icon(Icons.phone),
    ));
  }

  final fullNameController = TextEditingController();
  final weightController = TextEditingController();
  final tallController = TextEditingController();
  final genderController = TextEditingController();
  final birthDateController = TextEditingController();
  final referencePatientAccountIdController = TextEditingController();

  // قائمة لإدارة حقول الهاتف
  RxList<TextEditingController> phoneControllers =
      <TextEditingController>[].obs;

  // لإضافة حقل رقم هاتف جديد
  void addPhoneField() {
    phoneControllers.add(TextEditingController());
  }

  // التحقق من صحة الحقول
  String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  // إرسال البيانات إلى الـ API
  Future<void> addPatient(String token) async {
    final url = Uri.parse('https://154.12.230.8:901/api/DoctorPatient');

    try {
      var request = http.MultipartRequest('POST', url);

      // إضافة الـ Authorization header
      request.headers['Authorization'] = 'Bearer $token';

      // إضافة الحقول كـ form-data
      request.fields['fullName'] = fullNameController.text;
      request.fields['patientWeight'] = weightController.text;
      request.fields['patientTall'] = tallController.text;
      request.fields['gender'] = genderController.text;
      request.fields['birthDate'] = birthDateController.text;
      request.fields['referencePatientAccountIdController'] =
          referencePatientAccountIdController.text;

      // إضافة أرقام الهواتف كقائمة في JSON
      request.fields['phoneNumbers'] =
          jsonEncode(phoneControllers.map((c) => c.text).toList());

      // إرسال الطلب
      var response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar(
            'تم إضافة المريض بنجاح',
            snackPosition: SnackPosition.BOTTOM,
            "لقد قمت بإنشاء مريض جديد بنجاح يمكنك الآن استعراض معلوماته ضمن صفحة المرضى.");
        print('Patient added successfully');
      } else {
        // معالجة الخطأ هنا
        print('Failed to add patient');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
