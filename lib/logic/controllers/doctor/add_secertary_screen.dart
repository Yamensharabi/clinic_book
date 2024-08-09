import 'dart:convert';

import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/view/auth/login/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddSecertaryController extends GetxController {
  RxString selectedGender = ''.obs;

  void selectGender(String gender) {
    selectedGender.value = gender;
  }
}
