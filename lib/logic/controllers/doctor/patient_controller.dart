import 'dart:convert';
import 'package:clinbook/model/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PatientsController extends GetxController {
  RxList<Patient> patientsList = <Patient>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    isLoading(true);
    final url =
        'https://154.12.230.8:901/api/DoctorPatient?perPage=100&page=1'; // URL without pagination

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJkb2N0b3IyQGNsaW5pYy5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc5ZWU3NDk4LTc1MzgtNDdjMS04NzlmLTQxOGQ2MDI3OTFjNSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyJHZXREb2N0b3JQYXRpZW50cyIsIkdldERvY3RvckFwcG9pbnRtZW50cyIsIkdldENsaW5pY1dvcmtIb3VycyIsIkRvY3RvciIsIkFkZERvY3RvclBhdGllbnQiLCJVcGRhdGVXb3JrSG91cnMiXSwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwOS8wOS9pZGVudGl0eS9jbGFpbXMvYWN0b3IiOiJEb2N0b3IiLCJleHAiOjE3MjU5ODk3NDQsImlzcyI6Imh0dHBzOi8vMTU0LjEyLjIzMC44OjkwMSIsImF1ZCI6Imh0dHBzOi8vMTU0LjEyLjIzMC44OjkwMSJ9.gGKUG-4RXtznTy8d8sUjLaW_dXzXT3QlRETDhN5V_vw'
      });
      debugPrint("statusCode: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List patientsData = data['data']['list'];

        if (patientsData.isEmpty) {
          print("No patients in response");
        }

        List<Patient> patients = patientsData
            .map((patientJson) => Patient.fromJson(patientJson))
            .toList();

        print("Patients fetched: ${patients.length}");
        patientsList.value = patients; // Set all patients
        Get.snackbar("patientsList", "${patientsList.length}");
      } else {
        Get.snackbar("Failed", "Failed to load patients");
        print("Failed to load patients");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Failed", "$e");
    } finally {
      isLoading(false);
    }
  }
}
