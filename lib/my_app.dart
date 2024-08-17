import 'package:clinbook/constants/app_routes.dart';
import 'package:clinbook/constants/app_theme.dart';
import 'package:clinbook/core/localization/change_locale.dart';
import 'package:clinbook/core/localization/translation.dart';
import 'package:clinbook/logic/bindings/root_binding.dart';
import 'package:clinbook/logic/controllers/doctor/root/root_controller.dart';
import 'package:clinbook/test_screen.dart';
import 'package:clinbook/view/auth/login/screen/login_screen.dart';
import 'package:clinbook/view/auth/signup/screen/signup_screen.dart';
import 'package:clinbook/view/doctor/add_work_hours/screen/add_work_hours_screen.dart';
import 'package:clinbook/view/doctor/appointemnt_datails/screen/appoinement_details_screen.dart';
import 'package:clinbook/view/doctor/previous_appointments/screen/previous_appointments_screen.dart';
import 'package:clinbook/view/doctor/root/screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJkb2N0b3IyQGNsaW5pYy5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc5ZWU3NDk4LTc1MzgtNDdjMS04NzlmLTQxOGQ2MDI3OTFjNSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyJHZXREb2N0b3JQYXRpZW50cyIsIkdldERvY3RvckFwcG9pbnRtZW50cyIsIkdldENsaW5pY1dvcmtIb3VycyIsIkRvY3RvciIsIkFkZERvY3RvclBhdGllbnQiLCJVcGRhdGVXb3JrSG91cnMiXSwiZXhwIjoxNzI1Mjk2MjgyLCJpc3MiOiJodHRwczovLzE1NC4xMi4yMzAuODo5MDEiLCJhdWQiOiJodHRwczovLzE1NC4xMi4yMzAuODo5MDEifQ.2eduHvp-0MivIEIW1GvMyMvcOHEhtOF1hZnvMzxw_Do';
    return ScreenUtilInit(
        designSize: const Size(390, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, _) => GetMaterialApp(
              translations: MyTranslation(),
              locale: controller.language,
              theme: AppTheme.themeArabic,
              debugShowCheckedModeBanner: false,
              home: SignupScreen(
                  //  token: token,
                  ),
              //initialBinding: RootBinding(),
              // initialRoute: AppRoutes.rootScreen,
            ));
  }
}
