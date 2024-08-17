import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/constants/app_svgs.dart';
import 'package:clinbook/logic/controllers/temp_controller.dart';
import 'package:clinbook/view/doctor/home/screen/doctor_home_screen.dart';
import 'package:clinbook/view/doctor/patients/screen/patients_screen.dart';
import 'package:clinbook/view/doctor/previous_appointments/screen/previous_appointments_screen.dart';
import 'package:clinbook/view/doctor/show_secertaries/screen/show_secertaries_screen.dart';
import 'package:clinbook/view/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreenn extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> pages = [
    const DoctorHomeScreen(),
    PatientsScreen(),
    PreviousAppointmentsScreen(),
    ShowSecertariesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => pages[navigationController.selectedIndex.value]),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          SvgPicture.asset(
            AppSvgs.home,
            color: Colors.white,
          ),
          SvgPicture.asset(
            AppSvgs.appointemnts,
            color: Colors.white,
          ),
          SvgPicture.asset(
            AppSvgs.person_call,
            color: Colors.white,
          ),
          SvgPicture.asset(
            AppSvgs.settings,
            color: Colors.white,
          )
        ],
        onTap: (index) {
          navigationController.changeIndex(index);
        },
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: AppColors.orange,
        color: AppColors.mainColor,
        height: 60,
      ),
    );
  }
}

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 4', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 3', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 2', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page 1', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
