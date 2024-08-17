import 'dart:io';

import 'package:clinbook/core/services/my_services.dart';
import 'package:clinbook/logic/controllers/doctor/root/root_controller.dart';
import 'package:clinbook/logic/controllers/doctor/work_hours_controller.dart';
import 'package:clinbook/logic/controllers/temp_controller.dart';
import 'package:clinbook/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  HttpClient().badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  /*  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black)); */
  WidgetsFlutterBinding.ensureInitialized();
  initialServices();
  runApp(const MyApp());
}
