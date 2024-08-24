import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/horizontal_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/logic/controllers/doctor/patient_controller.dart';
import 'package:clinbook/view/doctor/home/screen/add_patient_screen.dart';
import 'package:clinbook/view/doctor/patients/screen/patient_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientsScreen extends StatelessWidget {
  final PatientsController patientsController = Get.put(PatientsController());

  @override
  Widget build(BuildContext context) {
    print("Building PatientsScreen...");

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: AppColors.mainColor),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                onPressed: () {
                  Get.to(() => AddPatientScreen(),
                      transition: Transition.circularReveal,
                      duration: const Duration(milliseconds: 400));
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 24,
                )),
          )),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                      text: 'ClinBook',
                      textStyle: context.textTheme.titleLarge!
                          .copyWith(color: AppColors.secondaryColor)),
                  const HorizantalSizedBox(4),
                  Container(
                    height: 22,
                    width: 8,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4))),
                  ),
                ],
              ),
              const VerticalSizedBox(20),
              CustomText(
                text: "المرضى",
                textStyle: context.textTheme.titleMedium!
                    .copyWith(color: AppColors.mainColor),
              ),
              GetBuilder<PatientsController>(
                builder: (controller) {
                  print("Inside GetBuilder...");
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    print("Building ListView...");
                    if (controller.patientsList.isEmpty) {
                      return const Center(child: Text("No patients found"));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.patientsList.length,
                      itemBuilder: (context, index) {
                        final patient = controller.patientsList[index];
                        return InkWell(
                          onTap: () {
                            Get.to(() =>
                                PatientDetailScreen(patientId: patient.id));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.grey2,
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: patient.fullName.isNotEmpty
                                        ? patient.fullName
                                        : "No Name",
                                    textStyle: TextStyle(
                                        color: AppColors.secondaryColor),
                                  ),
                                  const VerticalSizedBox(4),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: patient.birthDate!.isNotEmpty
                                            ? "${patient.birthDate} عام"
                                            : "",
                                      ),
                                      const HorizantalSizedBox(5),
                                      CustomText(
                                        text: patient.patientWeight!.isNotEmpty
                                            ? "${patient.patientWeight} KG"
                                            : "",
                                      ),
                                      const HorizantalSizedBox(5),
                                      CustomText(
                                        text: patient.patientTall!.isNotEmpty
                                            ? "${patient.patientTall} CM"
                                            : "",
                                      ),
                                      const HorizantalSizedBox(5),
                                      CustomText(
                                        text: patient.gender!.isNotEmpty
                                            ? (patient.gender == "male"
                                                ? "ذكر"
                                                : "أنثى")
                                            : "",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
