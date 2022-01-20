// To parse this JSON data, do
//
//     final games = gamesFromJson(jsonString);

import 'dart:convert';

Games gamesFromJson(String str) => Games.fromJson(json.decode(str));

String gamesToJson(Games data) => json.encode(data.toJson());

class Games {
  Games({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.description,
    this.filters,
  });

  int? count;
  String? next;
  dynamic previous;
  List<Result>? results;
  String? description;
  Filters? filters;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        description: json["description"],
        filters: Filters.fromJson(json["filters"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "description": description,
        "filters": filters!.toJson(),
      };
}

class Filters {
  Filters({
    this.years,
  });

  List<FiltersYear>? years;

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        years: List<FiltersYear>.from(
            json["years"].map((x) => FiltersYear.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "years": List<dynamic>.from(years!.map((x) => x.toJson())),
      };
}

class FiltersYear {
  FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.count,
  });

  int? from;
  int? to;
  String? filter;
  int? decade;
  List<YearYear>? years;
  int? count;

  factory FiltersYear.fromJson(Map<String, dynamic> json) => FiltersYear(
        from: json["from"],
        to: json["to"],
        filter: json["filter"],
        decade: json["decade"],
        years:
            List<YearYear>.from(json["years"].map((x) => YearYear.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "filter": filter,
        "decade": decade,
        "years": List<dynamic>.from(years!.map((x) => x.toJson())),
        "count": count,
      };
}

class YearYear {
  YearYear({
    this.year,
    this.count,
    this.nofollow,
  });

  int? year;
  int? count;
  bool? nofollow;

  factory YearYear.fromJson(Map<String, dynamic> json) => YearYear(
        year: json["year"],
        count: json["count"],
        nofollow: json["nofollow"],
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "count": count,
        "nofollow": nofollow,
      };
}

class Result {
  Result({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.backgroundImage,
    this.rating,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  int? id;
  String? slug;
  String? name;
  DateTime? released;
  String? backgroundImage;
  double? rating;
  List<Rating>? ratings;
  int? ratingsCount;
  int? reviewsTextCount;
  int? added;
  int? playtime;
  int? suggestionsCount;
  DateTime? updated;
  dynamic userGame;
  int? reviewsCount;
  Color? saturatedColor;
  Color? dominantColor;
  List<PlatformElement>? platforms;
  List<ParentPlatform>? parentPlatforms;
  List<Genre>? genres;
  List<Store>? stores;
  List<Genre>? tags;
  EsrbRating? esrbRating;
  List<ShortScreenshot>? shortScreenshots;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: DateTime.parse(json["released"]),
        backgroundImage: json["background_image"],
        rating: json["rating"].toDouble(),
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        playtime: json["playtime"],
        suggestionsCount: json["suggestions_count"],
        updated: DateTime.parse(json["updated"]),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        saturatedColor: colorValues.map[json["saturated_color"]],
        dominantColor: colorValues.map[json["dominant_color"]],
        platforms: List<PlatformElement>.from(
            json["platforms"].map((x) => PlatformElement.fromJson(x))),
        parentPlatforms: List<ParentPlatform>.from(
            json["parent_platforms"].map((x) => ParentPlatform.fromJson(x))),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        tags: List<Genre>.from(json["tags"].map((x) => Genre.fromJson(x))),
        esrbRating: EsrbRating.fromJson(json["esrb_rating"]),
        shortScreenshots: List<ShortScreenshot>.from(
            json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released":
            "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "background_image": backgroundImage,
        "rating": rating,
        "ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "playtime": playtime,
        "suggestions_count": suggestionsCount,
        "updated": updated!.toIso8601String(),
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "saturated_color": colorValues.reverse[saturatedColor],
        "dominant_color": colorValues.reverse[dominantColor],
        "platforms": List<dynamic>.from(platforms!.map((x) => x.toJson())),
        "parent_platforms":
            List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores!.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "esrb_rating": esrbRating!.toJson(),
        "short_screenshots":
            List<dynamic>.from(shortScreenshots!.map((x) => x.toJson())),
      };
}

enum Color { THE_0_F0_F0_F }

final colorValues = EnumValues({"0f0f0f": Color.THE_0_F0_F0_F});

class EsrbRating {
  EsrbRating({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  Domain? domain;
  Language? language;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain:
            json["domain"] == null ? null : domainValues.map[json["domain"]],
        language: json["language"] == null
            ? null
            : languageValues.map[json["language"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain == null ? null : domainValues.reverse[domain],
        "language": language == null ? null : languageValues.reverse[language],
      };
}

enum Domain {
  STORE_PLAYSTATION_COM,
  EPICGAMES_COM,
  STORE_STEAMPOWERED_COM,
  MARKETPLACE_XBOX_COM,
  MICROSOFT_COM,
  GOG_COM,
  NINTENDO_COM,
  PLAY_GOOGLE_COM,
  APPS_APPLE_COM
}

final domainValues = EnumValues({
  "apps.apple.com": Domain.APPS_APPLE_COM,
  "epicgames.com": Domain.EPICGAMES_COM,
  "gog.com": Domain.GOG_COM,
  "marketplace.xbox.com": Domain.MARKETPLACE_XBOX_COM,
  "microsoft.com": Domain.MICROSOFT_COM,
  "nintendo.com": Domain.NINTENDO_COM,
  "play.google.com": Domain.PLAY_GOOGLE_COM,
  "store.playstation.com": Domain.STORE_PLAYSTATION_COM,
  "store.steampowered.com": Domain.STORE_STEAMPOWERED_COM
});

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  EsrbRating? platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: EsrbRating.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform!.toJson(),
      };
}

class PlatformElement {
  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
  });

  PlatformPlatform? platform;
  DateTime? releasedAt;
  Requirements? requirementsEn;

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null
            ? null
            : DateTime.parse(json["released_at"]),
        requirementsEn: json["requirements_en"] == null
            ? null
            : Requirements.fromJson(json["requirements_en"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform!.toJson(),
        "released_at": releasedAt == null
            ? null
            : "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements_en":
            requirementsEn == null ? null : requirementsEn!.toJson(),
      };
}

class PlatformPlatform {
  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.gamesCount,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? slug;
  dynamic image;
  int? gamesCount;
  String? imageBackground;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Requirements {
  Requirements({
    this.minimum,
    this.recommended,
  });

  String? minimum;
  String? recommended;

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"] == null ? null : json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended == null ? null : recommended,
      };
}

class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  int? id;
  Title? title;
  int? count;
  double? percent;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: titleValues.map[json["title"]],
        count: json["count"],
        percent: json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "count": count,
        "percent": percent,
      };
}

enum Title { EXCEPTIONAL, RECOMMENDED, MEH, SKIP }

final titleValues = EnumValues({
  "exceptional": Title.EXCEPTIONAL,
  "meh": Title.MEH,
  "recommended": Title.RECOMMENDED,
  "skip": Title.SKIP
});

class ShortScreenshot {
  ShortScreenshot({
    this.id,
    this.image,
  });

  int? id;
  String? image;

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class Store {
  Store({
    this.id,
    this.store,
  });

  int? id;
  Genre? store;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        store: Genre.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store": store!.toJson(),
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
