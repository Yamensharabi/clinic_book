/* // LocalizationController.dart
class LocalizationController extends GetxController {
  final _localizationManager = Get.find<LocalizationManager>();
  final language = Rx<Languages>(Languages.en);

  @override
  void onInit() {
    super.onInit();
    _localizationManager.initManager(YOUR_API_SECRET_KEY);
    _readLocale();
  }

  void _readLocale() {
    language.value = _localizationManager.language.value;
  }

  void updateLanguage(Languages newLanguage) {
    _localizationManager.updateLanguage(newLanguage);
    language.value = newLanguage;
    update();
  }

  String getTranslation(String key) {
    return _localizationManager.getValue(key);
  }
}

// main.dart
void main() {
  GetMaterialApp(
    title: 'My App',
    locale: Locale(
      localizationController.language.value.getLocalString,
    ),
    home: HomePage(),
  );
}

// HomePage.dart
class HomePage extends StatelessWidget {
  final localizationController = Get.find<LocalizationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            localizationController.getTranslation('app_title'),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                localizationController.getTranslation('hello_text'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                localizationController.updateLanguage(Languages.ar);
              },
              child: Text(
                localizationController.getTranslation('change_language'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 */