import 'dart:io';

import 'package:clinbook/logic/services/temp_services.dart';
import 'package:clinbook/model/temp_model.dart';
import 'package:get/get.dart';

class TempController extends GetxController {
  var tempList = <TempModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getTemps();
  }

  void getTemps() async {
    var temps = await TempServices.getTemps();

    try {
      isLoading(true);
      print(tempList);
      if (temps.isNotEmpty) {
        tempList.addAll(temps);
        print(tempList);
      }
    } finally {
      isLoading(false);
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
