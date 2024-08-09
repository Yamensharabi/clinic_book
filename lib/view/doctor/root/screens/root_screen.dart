import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/logic/controllers/doctor/root/root_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:animations/animations.dart';

class RootScreen extends GetView<RootController> {
  final iconList = const [
    Icons.notifications,
    Icons.chat_bubble,
    Icons.favorite,
    Icons.home
  ];

  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            GetBuilder<RootController>(
              //----------------------------Transition builder to switch between screens
              builder: (_) => PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                //-----------------------------------------call all of screens
                child: controller.pageList.elementAt(controller.currentPage),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<RootController>(
          builder: (_) => CurvedNavigationBar(
            index: controller.currentPage,
            height: 60,
            items: const [
              Icon(Icons.notifications,
                  color: Colors.white), //--notification icon
              Icon(Icons.chat_bubble, color: Colors.white), //--chat icon
              Icon(Icons.add, color: Colors.white), //--add icon
              Icon(Icons.favorite, color: Colors.white), //--favorite icon
              Icon(Icons.home, color: Colors.white), //--home icon
            ],
            color: AppColors.mainColor,
            buttonBackgroundColor: AppColors.orange,
            backgroundColor: Colors.transparent,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (index) =>
                {controller.selectedPage(index)}, //--select the screen on tap
            letIndexChange: (index) => true,
          ),
        ));
  }
}
