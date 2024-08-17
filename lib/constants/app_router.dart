import 'package:clinbook/constants/app_routes.dart';
import 'package:clinbook/logic/bindings/root_binding.dart';
import 'package:clinbook/view/doctor/root/screens/root_screen.dart';
import 'package:get/get.dart';

class AppRouters {
  static final routes = [
//--------------------------Auth-----------------------------

    GetPage(
      name: AppRoutes.rooScreen,
      page: () => const RootScreen(),
      transition: Transition.downToUp,
      binding: RootBinding(),
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
