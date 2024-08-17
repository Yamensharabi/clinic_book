class Patient {
  final String id;
  final String fullName;
  final String? birthDate;
  final String? patientWeight;
  final String? patientTall;
  final String? gender;

  Patient({
    required this.id,
    required this.fullName,
    this.birthDate,
    this.patientWeight,
    this.patientTall,
    this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? 'No Name',
      birthDate: json['birthDate']?.toString() ?? 'No Birthdate',
      patientWeight: json['patientWeight']?.toString() ?? 'No Weight',
      patientTall: json['patientTall']?.toString() ?? 'No Tall',
      gender: json['gender'] ?? 'No Gender',
    );
  }
}
