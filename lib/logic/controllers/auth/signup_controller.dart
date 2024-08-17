// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/view/auth/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  RxString selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signup() async {
    print("start");

    try {
      var url = Uri.parse(
          "https://154.12.230.8:901/api/Auth/register"); // تغيير URL إلى رابط التسجيل
      print("URL: $url");

      // استخدام MultipartRequest لإرسال البيانات كـ form-data
      var request = http.MultipartRequest('POST', url);
      request.fields['UserName'] = userNameController.text;
      request.fields['Password'] = passwordController.text;
      request.fields['Email'] = emailController.text;
      request.fields['FirstName'] = firstNameController.text;
      request.fields['PasswordConfirmation'] = confirmPasswordController.text;

      print("Fields: ${request.fields}");

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print("Response status code: ${response.statusCode}");
      print("Response body: $responseBody");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(responseBody);
        print(json);
        if (json['status'] == 'Success') {
          var token = json['data']['token'];
          print(token);

          // تنظيف الحقول والانتقال إلى شاشة تسجيل الدخول
          userNameController.clear();
          passwordController.clear();
          emailController.clear();
          firstNameController.clear();
          confirmPasswordController.clear();

          Get.to(() => const LoginScreen());
        } else {
          throw Exception('Signup failed');
        }
      } else {
        throw Exception('Failed to signup: $responseBody');
      }
    } catch (e) {
      print("Error: $e");
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            title: Text("خطأ !", style: context.textTheme.titleLarge),
            content: Text(
              '$eيرجى إدخال جميع القيم بشكل صحيح',
              style: context.textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('حسناً',
                    style: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.mainColor)),
              ),
            ],
          );
        },
      );
    }
  }
}
