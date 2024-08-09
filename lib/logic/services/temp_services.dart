import 'package:http/http.dart' as http;
import 'package:clinbook/model/temp_model.dart';

class TempServices {
  static Future<List<TempModel>> getTemps() async {
    /*   @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  } */

    var response =
        await http.get(Uri.parse('https://154.12.230.8:801/weatherforecast'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return tempModelFromJson(jsonData);
    } else {
      return throw Exception('Failed');
    }
  }
}
