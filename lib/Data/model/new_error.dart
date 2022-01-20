// To parse this JSON data, do
//
//     final errorRes = errorResFromJson(jsonString);

import 'dart:convert';

ErrorRes errorResFromJson(String str) => ErrorRes.fromJson(json.decode(str));

String errorResToJson(ErrorRes data) => json.encode(data.toJson());

class ErrorRes {
  ErrorRes({
    this.status,
    this.code,
    this.message,
  });

  String? status;
  String? code;
  String? message;

  factory ErrorRes.fromJson(Map<String, dynamic> json) => ErrorRes(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
      };
}
