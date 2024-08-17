// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/view/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> login() async {
    print("start");

    try {
      var url = Uri.parse("https://154.12.230.8:901/api/Auth/login");
      print("URL: $url");

      // استخدام MultipartRequest لإرسال البيانات كـ form-data
      var request = http.MultipartRequest('POST', url);
      request.fields['UserName'] = userNameController.text;
      request.fields['Password'] = passwordController.text;

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
          final SharedPreferences? prefs = await _pref;

          await prefs?.setString('token', token);
          userNameController.clear();
          passwordController.clear();
          Get.to(() => const HomeScreen());
        } else {
          throw Exception('Login failed');
        }
      } else {
        throw Exception('Failed to login: $responseBody');
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
              'يرجى إدخال البريد الإلكتروني وكلمة المرور بشكل صحيح',
              style: context.textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK',
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
