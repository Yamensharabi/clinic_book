import 'package:clinbook/logic/controllers/temp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  TempController testController = Get.put(TempController());
  TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (testController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 600,
                  child: ListView.builder(
                    itemCount: testController.tempList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Center(
                            child:
                                Text("${testController.tempList[index].date}"),
                          ),
                          Center(
                            child: Text(
                                "${testController.tempList[index].temperatureC}"),
                          ),
                          Center(
                            child: Text(
                                "${testController.tempList[index].summary}"),
                          ),
                          Center(
                            child: Text(
                                "${testController.tempList[index].temperatureF}"),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      }
    }));
  }
}
