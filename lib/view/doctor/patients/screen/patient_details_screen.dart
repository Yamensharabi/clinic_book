import 'package:clinbook/logic/controllers/doctor/patient_detaile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';

class PatientDetailScreen extends StatelessWidget {
  final String patientId;

  PatientDetailScreen({required this.patientId});

  @override
  Widget build(BuildContext context) {
    final PatientDetailController controller =
        Get.put(PatientDetailController());

    // تحميل تفاصيل المريض عند بداية الصفحة
    controller.fetchPatientDetail(patientId);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Patient Details'),
        backgroundColor: AppColors.mainColor,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final patient = controller.patientDetail.value;
        if (patient == null) {
          return const Center(child: Text('No details found'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "Name: ${patient.fullName ?? 'No Name'}",
                textStyle: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Weight: ${patient.patientWeight ?? 'No Weight'}",
                textStyle: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Tall: ${patient.patientTall ?? 'No Tall'}",
                textStyle: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Gender: ${patient.gender ?? 'No Gender'}",
                textStyle: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              CustomText(
                text: "Birthdate: ${patient.birthDate ?? 'No Birthdate'}",
                textStyle: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              CustomText(
                text:
                    "Diseases: ${patient.diseases?.join(', ') ?? 'No Diseases'}",
                textStyle: context.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              CustomText(
                text:
                    "Medicines: ${patient.medicines?.join(', ') ?? 'No Medicines'}",
                textStyle: context.textTheme.titleLarge,
              ),
            ],
          ),
        );
      }),
    );
  }
}
