// To parse this JSON data, do
//
//     final newRelease = newReleaseFromJson(jsonString);

import 'dart:convert';

NewRelease newReleaseFromJson(String str) =>
    NewRelease.fromJson(json.decode(str));

String newReleaseToJson(NewRelease data) => json.encode(data.toJson());

class NewRelease {
  NewRelease({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  factory NewRelease.fromJson(Map<String, dynamic> json) => NewRelease(
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
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.games,
  });

  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  List<Game>? games;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "games": List<dynamic>.from(games!.map((x) => x.toJson())),
      };
}

class Game {
  Game({
    this.id,
    this.slug,
    this.name,
    this.added,
  });

  int? id;
  String? slug;
  String? name;
  int? added;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        added: json["added"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "added": added,
      };
}
