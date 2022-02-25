// To parse this JSON data, do
//
//     final creators = creatorsFromJson(jsonString);

import 'dart:convert';

Creators creatorsFromJson(String str) => Creators.fromJson(json.decode(str));

String creatorsToJson(Creators data) => json.encode(data.toJson());

class Creators {
  Creators({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
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
    this.image,
    this.imageBackground,
    this.gamesCount,
    this.positions,
    this.games,
  });

  int? id;
  String? name;
  String? slug;
  String? image;
  String? imageBackground;
  int? gamesCount;
  List<Game>? positions;
  List<Game>? games;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        imageBackground: json["image_background"],
        gamesCount: json["games_count"],
        positions:
            List<Game>.from(json["positions"].map((x) => Game.fromJson(x))),
        games: List<Game>.from(json["games"].map((x) => Game.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "image_background": imageBackground,
        "games_count": gamesCount,
        "positions": List<dynamic>.from(positions!.map((x) => x.toJson())),
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
        added: json["added"] == null ? null : json["added"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "added": added == null ? null : added,
      };
}
