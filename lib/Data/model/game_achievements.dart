// To parse this JSON data, do
//
//     final gameAchievements = gameAchievementsFromJson(jsonString);

import 'dart:convert';

GameAchievements gameAchievementsFromJson(String str) =>
    GameAchievements.fromJson(json.decode(str));

String gameAchievementsToJson(GameAchievements data) =>
    json.encode(data.toJson());

class GameAchievements {
  GameAchievements({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  factory GameAchievements.fromJson(Map<String, dynamic> json) =>
      GameAchievements(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.description,
    this.image,
    this.percent,
  });

  int? id;
  String? name;
  String? description;
  String? image;
  String? percent;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        percent: json["percent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "percent": percent,
      };
}
