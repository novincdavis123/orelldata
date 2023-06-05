// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) =>
    List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
  int academicYearId;
  String academicYear;
  String academicStart;
  String academicEnd;
  dynamic institutionId;
  DateTime modifiedDate;
  dynamic pageNo;
  dynamic rowCount;
  dynamic totalCount;
  dynamic createdBy;
  dynamic modifiedBy;
  dynamic academicId;
  dynamic isDeleted;
  dynamic logo;
  dynamic institutionName;

  Student({
    required this.academicYearId,
    required this.academicYear,
    required this.academicStart,
    required this.academicEnd,
    this.institutionId,
    required this.modifiedDate,
    this.pageNo,
    this.rowCount,
    this.totalCount,
    this.createdBy,
    this.modifiedBy,
    this.academicId,
    this.isDeleted,
    this.logo,
    this.institutionName,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        academicYearId: json["academicYearId"],
        academicYear: json["academicYear"],
        academicStart: json["academicStart"],
        academicEnd: json["academicEnd"],
        institutionId: json["institutionId"],
        modifiedDate: DateTime.parse(json["modifiedDate"]),
        pageNo: json["pageNo"],
        rowCount: json["rowCount"],
        totalCount: json["totalCount"],
        createdBy: json["createdBy"],
        modifiedBy: json["modifiedBy"],
        academicId: json["academicId"],
        isDeleted: json["isDeleted"],
        logo: json["logo"],
        institutionName: json["institutionName"],
      );

  Map<String, dynamic> toJson() => {
        "academicYearId": academicYearId,
        "academicYear": academicYear,
        "academicStart": academicStart,
        "academicEnd": academicEnd,
        "institutionId": institutionId,
        "modifiedDate": modifiedDate.toIso8601String(),
        "pageNo": pageNo,
        "rowCount": rowCount,
        "totalCount": totalCount,
        "createdBy": createdBy,
        "modifiedBy": modifiedBy,
        "academicId": academicId,
        "isDeleted": isDeleted,
        "logo": logo,
        "institutionName": institutionName,
      };
}
