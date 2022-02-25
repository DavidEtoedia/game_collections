// To parse this JSON data, do
//
//     final failure = failureFromJson(jsonString);

import 'dart:convert';

Failure failureFromJson(String str) => Failure.fromJson(json.decode(str));

String failureToJson(Failure data) => json.encode(data.toJson());

class Failure {
  Failure({
    this.error,
  });

  String? error;

  factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
      };
}
