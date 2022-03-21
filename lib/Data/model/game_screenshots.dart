// To parse this JSON data, do
//
//     final gameScreenShots = gameScreenShotsFromJson(jsonString);

import 'dart:convert';

GameScreenShots gameScreenShotsFromJson(String str) =>
    GameScreenShots.fromJson(json.decode(str));

String gameScreenShotsToJson(GameScreenShots data) =>
    json.encode(data.toJson());

class GameScreenShots {
  GameScreenShots({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory GameScreenShots.fromJson(Map<String, dynamic> json) =>
      GameScreenShots(
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
    this.image,
    this.width,
    this.height,
    this.isDeleted,
  });

  int? id;
  String? image;
  int? width;
  int? height;
  bool? isDeleted;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        image: json["image"],
        width: json["width"],
        height: json["height"],
        isDeleted: json["is_deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "width": width,
        "height": height,
        "is_deleted": isDeleted,
      };
}
