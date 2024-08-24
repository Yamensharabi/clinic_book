class PatientDetail {
  String? id;
  String? fullName;
  String? patientWeight;
  String? patientTall;
  String? gender;
  String? birthDate;
  List<String>? communicationWays;
  List<String>? diseases;
  List<String>? medicines;

  PatientDetail({
    this.id,
    this.fullName,
    this.patientWeight,
    this.patientTall,
    this.gender,
    this.birthDate,
    this.communicationWays,
    this.diseases,
    this.medicines,
  });

  factory PatientDetail.fromJson(Map<String, dynamic> json) {
    return PatientDetail(
      id: json['id'],
      fullName: json['fullName'],
      patientWeight: json['patientWeight'],
      patientTall: json['patientTall'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      communicationWays: List<String>.from(json['communicationWays']),
      diseases: List<String>.from(json['diseases']),
      medicines: List<String>.from(json['medicines']),
    );
  }
}
