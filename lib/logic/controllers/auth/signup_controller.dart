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
      var headers = {'Content-Type': 'application/json'};
      print("Headers: $headers");
      var url = Uri.parse("https://154.12.230.8:901/api/Auth/login");
      print("URL: $url");
      Map body = {
        'UserName': userNameController.text,
        'Password': passwordController.text,
        'Email': emailController.text,
        'FirstName': firstNameController.text,
        'PasswordConfirmation': confirmPasswordController.text,
      };
      print("Body: $body");
      print("UserName: ${userNameController.text}");
      print("Password: ${passwordController.text}");

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final json = jsonDecode(response.body);
        print(json);
        if (json['status'] == 'success') {
          var token = json['data']['token'];
          print(token);

          userNameController.clear();
          passwordController.clear();
          Get.to(() => const LoginScreen());
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
              'خطأ',
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
