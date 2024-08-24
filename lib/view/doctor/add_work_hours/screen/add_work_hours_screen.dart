import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:clinbook/constants/app_colors.dart';
import 'package:clinbook/core/shared_widgets/custom_text.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/horizontal_sizedbox.dart';
import 'package:clinbook/core/shared_widgets/sized_boxes/vertical_sizedbox.dart';
import 'package:clinbook/logic/controllers/doctor/work_hours_controller.dart';

class AddWorkHoursScreen extends StatelessWidget {
  final String token;
  AddWorkHoursScreen({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final WorkHoursController controller = Get.put(WorkHoursController(token));

    return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.mainColor),
                      ),
                      CustomText(
                          text: 'ClinBook',
                          textStyle: TextStyle(color: AppColors.thirdColor)),
                    ],
                  ),
                  const VerticalSizedBox(20),
                  Center(
                    child: CustomText(
                      text: 'تحديد مواعيد الدوام',
                      textStyle: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  const VerticalSizedBox(20),
                  ListView.builder(
                      itemCount: controller.allDays.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var day = controller.allDays[index];
                        bool hasWorkHours = controller.workHours
                            .any((workHour) => workHour.day == day);
                        var workHour = hasWorkHours
                            ? controller.workHours
                                .firstWhere((workHour) => workHour.day == day)
                            : null;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: day,
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                            const VerticalSizedBox(10),
                            if (hasWorkHours && workHour != null) ...[
                              workHourWidget(context, workHour, controller)
                            ] else ...[
                              noWorkHourWidget(context, day, controller)
                            ],
                            const VerticalSizedBox(5),
                            Divider(
                              color: AppColors.grey2,
                            )
                          ],
                        );
                      }),
                  const VerticalSizedBox(20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        //    controller.saveAllWorkHours();
                      },
                      child: const Text('حفظ'),
                    ),
                  ),
                ],
              );
            }
          }),
        )));
  }

  Widget workHourWidget(
      BuildContext context, WorkHours day, WorkHoursController controller) {
    var workStage = day.workStages[0];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.mainColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 18,
                      onPressed: () => showTimePickerDialog(
                          context, day.day, workStage, controller),
                      icon: const Icon(Icons.edit)),
                  const HorizantalSizedBox(3),
                  CustomText(
                    text: "الفترة",
                    textStyle: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            const VerticalSizedBox(5),
            CustomText(
                text:
                    "${formatTime(workStage.startMinute)} - ${formatTime(workStage.endMinute)}")
          ],
        ),
      ],
    );
  }

  Widget noWorkHourWidget(
      BuildContext context, String day, WorkHoursController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.mainColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      iconSize: 18,
                      onPressed: () =>
                          showTimePickerDialog(context, day, null, controller),
                      icon: const Icon(Icons.add)),
                  const HorizantalSizedBox(3),
                  CustomText(
                    text: "إضافة فترة",
                    textStyle: const TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
            const VerticalSizedBox(5),
            CustomText(text: "لم يتم تحديد دوام هذا اليوم")
          ],
        ),
      ],
    );
  }

  void showTimePickerDialog(BuildContext context, String day,
      WorkStage? workStage, WorkHoursController controller) {
    showDialog(
      context: context,
      builder: (context) {
        final startController = TextEditingController();
        final endController = TextEditingController();
        final durationController = TextEditingController();

        if (workStage != null) {
          startController.text = formatTime(workStage.startMinute);
          endController.text = formatTime(workStage.endMinute);
          durationController.text =
              workStage.expectedDurationInMinutes.toString();
        }

        return AlertDialog(
          title: const Text('حدد وقت الدوام'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: startController,
                style: TextStyle(color: AppColors.mainColor),
                decoration: const InputDecoration(labelText: 'وقت البداية'),
                readOnly: true,
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    startController.text = picked.format(context);
                  }
                },
              ),
              TextField(
                controller: endController,
                style: TextStyle(color: AppColors.mainColor),
                decoration: const InputDecoration(
                  labelText: 'وقت النهاية',
                ),
                readOnly: true,
                onTap: () async {
                  TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) {
                    endController.text = picked.format(context);
                  }
                },
              ),
              TextField(
                style: TextStyle(color: AppColors.mainColor),
                controller: durationController,
                decoration: const InputDecoration(
                  labelText: 'مدة الجلسة المتوقعة (دقائق)',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('إلغاء'),
            ),
            TextButton(
              onPressed: () {
                // تحويل وقت البداية والنهاية إلى دقائق
                final startMinute = _timeToMinutes(startController.text);
                final endMinute = _timeToMinutes(endController.text);
                final expectedDurationInMinutes =
                    int.tryParse(durationController.text) ?? 0;

                // تحديث ساعات العمل باستخدام عدد الدقائق والمدة المتوقعة
                controller.updateWorkHours(
                    day, 660, 600, expectedDurationInMinutes);
                Navigator.of(context).pop();
              },
              child: const Text('حفظ'),
            ),
          ],
        );
      },
    );
  }

  int _timeToMinutes(String time) {
    try {
      // صيغة AM/PM باستخدام DateFormat
      final format = DateFormat.jm();

      // تنظيف النص: إزالة أي رموز غير مرئية أو مسافات غير طبيعية
      final cleanedTime = time
          .replaceAll(RegExp(r'[^\x00-\x7F]+'), '') // إزالة أي رموز غير ASCII
          .trim(); // إزالة المسافات في البداية والنهاية

      // محاولة تحويل النص إلى DateTime باستخدام الصيغة المحددة
      final DateTime dateTime = format.parse(cleanedTime);

      // حساب عدد الدقائق من بداية اليوم
      final minutes = dateTime.hour * 60 + dateTime.minute;

      return minutes;
    } catch (e) {
      // في حالة وجود خطأ في التنسيق، يمكن عرض رسالة خطأ أو التعامل معها بطريقة أخرى
      print("Error parsing time: $e");
      return 0; // إعادة 0 كمثال للتعامل مع الخطأ
    }
  }

  String formatTime(int minutes) {
    final int hours = minutes ~/ 60;
    final int remainingMinutes = minutes % 60;
    final timeOfDay = TimeOfDay(hour: hours, minute: remainingMinutes);
    return timeOfDay.format(Get.context!);
  }
}
