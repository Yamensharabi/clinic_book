// To parse this JSON data, do
//
//     final tempModel = tempModelFromJson(jsonString);

import 'dart:convert';

List<TempModel> tempModelFromJson(String str) =>
    List<TempModel>.from(json.decode(str).map((x) => TempModel.fromJson(x)));

String tempModelToJson(List<TempModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TempModel {
  DateTime date;
  int temperatureC;
  String summary;
  int temperatureF;

  TempModel({
    required this.date,
    required this.temperatureC,
    required this.summary,
    required this.temperatureF,
  });

  factory TempModel.fromJson(Map<String, dynamic> json) => TempModel(
        date: DateTime.parse(json["date"]),
        temperatureC: json["temperatureC"],
        summary: json["summary"],
        temperatureF: json["temperatureF"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "temperatureC": temperatureC,
        "summary": summary,
        "temperatureF": temperatureF,
      };
}
