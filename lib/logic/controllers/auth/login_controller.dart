// ignore_for_file: avoid_print, unnecessary_nullable_for_final_variable_declarations

import 'dart:convert';

import 'package:clinbook/constants/app_api_links.dart';
import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/view/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> login() async {
    print("start");

    try {
      var headers = {'Content-Type': 'application/json'};
      print("Headers: $headers");
      var url = Uri.parse("https://154.12.230.8:901/api/Auth/login");
      print("URL: $url");
      Map<String, String> body = {
        'UserName': userNameController.text,
        'Password': passwordController.text,
      };
      print("Body: $body");
      print("UserName: ${userNameController.text}");
      print("Password: ${passwordController.text}");
      String jsonBody = jsonEncode(body);

      http.Response response = await http.post(
        url,
        body: jsonBody,
      );
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
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
        throw Exception('Failed to login: ${response.body}');
      }
    } catch (e) {
      print("Error: $e");
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text("خطأ !", style: context.textTheme.titleLarge),
            content: Text(
              'رجاء ادخل رقم الهاتف وكلمة السر بشكل صحيح',
              style: context.textTheme.titleMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK',
                    style: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.secondaryColor)),
              ),
            ],
          );
        },
      );
    }
  }
}
