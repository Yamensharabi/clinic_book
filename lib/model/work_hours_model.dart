class WorkHours {
  final String day;
  final List<WorkStage> workStages;

  WorkHours({required this.day, required this.workStages});

  factory WorkHours.fromJson(Map<String, dynamic> json) {
    var list = json['workStages'] as List;
    List<WorkStage> workStageList =
        list.map((i) => WorkStage.fromJson(i)).toList();

    return WorkHours(
      day: json['day'],
      workStages: workStageList,
    );
  }
}

class WorkStage {
  final int startMinute;
  final int endMinute;
  final int expectedDurationInMinutes;

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
