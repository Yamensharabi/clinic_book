import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WorkHoursController extends GetxController {
  var workHours = <WorkHours>[].obs;
  var isLoading = true.obs;

  final String token;
  final List<String> allDays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  WorkHoursController(this.token);

  @override
  void onInit() {
    super.onInit();
    fetchWorkHours();
  }

  void fetchWorkHours() async {
    final response = await http.get(
      Uri.parse(
          'https://154.12.230.8:901/api/clinic/b747e76f-c952-4610-95fa-68a13bcc2f08/workhours'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJkb2N0b3IyQGNsaW5pYy5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc5ZWU3NDk4LTc1MzgtNDdjMS04NzlmLTQxOGQ2MDI3OTFjNSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyJHZXREb2N0b3JQYXRpZW50cyIsIkdldERvY3RvckFwcG9pbnRtZW50cyIsIkdldENsaW5pY1dvcmtIb3VycyIsIkRvY3RvciIsIkFkZERvY3RvclBhdGllbnQiLCJVcGRhdGVXb3JrSG91cnMiXSwiZXhwIjoxNzI1Mjk2MjgyLCJpc3MiOiJodHRwczovLzE1NC4xMi4yMzAuODo5MDEiLCJhdWQiOiJodHRwczovLzE1NC4xMi4yMzAuODo5MDEifQ.2eduHvp-0MivIEIW1GvMyMvcOHEhtOF1hZnvMzxw_Do'
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body)['data']['workHours'] as List;
      workHours.value = data.map((i) => WorkHours.fromJson(i)).toList();
    } else {
      // Handle error
    }

    isLoading.value = false;
  }

  void updateWorkHours(String day, int startMinute, int endMinute,
      int expectedDurationInMinutes) {
    final workHoursIndex =
        workHours.indexWhere((element) => element.day == day);

    if (workHoursIndex != -1) {
      // تحديث ساعات العمل
      workHours[workHoursIndex].workStages[0].startMinute = startMinute;
      workHours[workHoursIndex].workStages[0].endMinute = endMinute;
      workHours[workHoursIndex].workStages[0].expectedDurationInMinutes =
          expectedDurationInMinutes;
    } else {
      // إضافة ساعات العمل الجديدة
      workHours.add(WorkHours(
        day: day,
        workStages: [
          WorkStage(
            startMinute: startMinute,
            endMinute: endMinute,
            expectedDurationInMinutes: expectedDurationInMinutes,
          ),
        ],
      ));
    }

    // لتحديث الشاشة بعد التعديل
    workHours.refresh();
  }

  void saveAllWorkHours(int expectedDurationInMinutes) async {
    final data = workHours
        .map((wh) => {
              'day': wh.day,
              'workStages': wh.workStages
                  .map((ws) => {
                        'startMinute': ws.startMinute,
                        'endMinute': ws.endMinute,
                        'expectedDurationInMinutes': expectedDurationInMinutes,
                      })
                  .toList(),
            })
        .toList();

    final response = await http.post(
      Uri.parse(
          'https://154.12.230.8:901/api/clinic/b747e76f-c952-4610-95fa-68a13bcc2f08/workhours'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJkb2N0b3IyQGNsaW5pYy5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc5ZWU3NDk4LTc1MzgtNDdjMS04NzlmLTQxOGQ2MDI3OTFjNSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyJHZXREb2N0b3JQYXRpZW50cyIsIkdldERvY3RvckFwcG9pbnRtZW50cyIsIkdldENsaW5pY1dvcmtIb3VycyIsIkRvY3RvciIsIkFkZERvY3RvclBhdGllbnQiLCJVcGRhdGVXb3JrSG91cnMiXSwiZXhwIjoxNzI1Mjk2MjgyLCJpc3MiOiJodHRwczovLzE1NC4xMi4yMzAuODo5MDEiLCJhdWQiOiJodHRwczovLzE1NC4xMi4yMzAuODo5MDEifQ.2eduHvp-0MivIEIW1GvMyMvcOHEhtOF1hZnvMzxw_Do',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'workHours': data,
        //  'ClinicId': 'b747e76f-c952-4610-95fa-68a13bcc2f08',
      }),
    );

    if (response.statusCode == 200) {
      // Handle successful save
    } else {
      // Handle error
    }
  }
}

class WorkHours {
  String day;
  List<WorkStage> workStages;

  WorkHours({required this.day, required this.workStages});

  factory WorkHours.fromJson(Map<String, dynamic> json) {
    var list = json['workStages'] as List;
    List<WorkStage> workStagesList =
        list.map((i) => WorkStage.fromJson(i)).toList();

    return WorkHours(
      day: json['day'],
      workStages: workStagesList,
    );
  }
}

class WorkStage {
  int startMinute;
  int endMinute;
  int expectedDurationInMinutes;

  WorkStage({
    required this.startMinute,
    required this.endMinute,
    required this.expectedDurationInMinutes,
  });

  factory WorkStage.fromJson(Map<String, dynamic> json) {
    return WorkStage(
      startMinute: json['startMinute'],
      endMinute: json['endMinute'],
      expectedDurationInMinutes: json['expectedDurationInMinutes'],
    );
  }
}

/* class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
 */