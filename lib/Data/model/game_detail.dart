// To parse this JSON data, do
//
//     final gameDetails = gameDetailsFromJson(jsonString);

import 'dart:convert';

GameDetails gameDetailsFromJson(String str) =>
    GameDetails.fromJson(json.decode(str));

String gameDetailsToJson(GameDetails data) => json.encode(data.toJson());

class GameDetails {
  GameDetails({
    this.id,
    this.slug,
    this.name,
    this.description,
    this.metacritic,
    this.released,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratings,
    this.reactions,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.achievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.metacriticUrl,
    this.gameSeriesCount,
    this.reviewsCount,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
  });

  int? id;
  String? slug;
  String? name;
  String? description;
  int? metacritic;
  DateTime? released;
  DateTime? updated;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  Map<String, int>? reactions;
  int? playtime;
  int? screenshotsCount;
  int? moviesCount;
  int? achievementsCount;
  String? redditUrl;
  String? redditName;
  String? redditDescription;
  String? redditLogo;
  int? redditCount;
  int? twitchCount;
  int? youtubeCount;
  int? reviewsTextCount;
  int? ratingsCount;
  int? suggestionsCount;
  String? metacriticUrl;
  int? gameSeriesCount;
  int? reviewsCount;
  List<Store>? stores;
  List<Developer>? developers;
  List<Developer>? genres;
  List<Developer>? tags;
  List<Developer>? publishers;
  EsrbRating? esrbRating;

  factory GameDetails.fromJson(Map<String, dynamic> json) => GameDetails(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        description: json["description"],
        metacritic: json["metacritic"],
        released: DateTime.parse(json["released"]),
        updated: DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"].toDouble(),
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        reactions: Map.from(json["reactions"])
            .map((k, v) => MapEntry<String, int>(k, v)),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        achievementsCount: json["achievements_count"],
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        redditCount: json["reddit_count"],
        twitchCount: json["twitch_count"],
        youtubeCount: json["youtube_count"],
        reviewsTextCount: json["reviews_text_count"],
        ratingsCount: json["ratings_count"],
        suggestionsCount: json["suggestions_count"],
        metacriticUrl: json["metacritic_url"],
        gameSeriesCount: json["game_series_count"],
        reviewsCount: json["reviews_count"],
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
        developers: List<Developer>.from(
            json["developers"].map((x) => Developer.fromJson(x))),
        genres: List<Developer>.from(
            json["genres"].map((x) => Developer.fromJson(x))),
        tags: List<Developer>.from(
            json["tags"].map((x) => Developer.fromJson(x))),
        publishers: List<Developer>.from(
            json["publishers"].map((x) => Developer.fromJson(x))),
        esrbRating: EsrbRating.fromJson(json["esrb_rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "description": description,
        "metacritic": metacritic,
        "released":
            "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "updated": updated!.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "reactions":
            Map.from(reactions!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "achievements_count": achievementsCount,
        "reddit_url": redditUrl,
        "reddit_name": redditName,
        "reddit_description": redditDescription,
        "reddit_logo": redditLogo,
        "reddit_count": redditCount,
        "twitch_count": twitchCount,
        "youtube_count": youtubeCount,
        "reviews_text_count": reviewsTextCount,
        "ratings_count": ratingsCount,
        "suggestions_count": suggestionsCount,
        "metacritic_url": metacriticUrl,
        "game_series_count": gameSeriesCount,
        "reviews_count": reviewsCount,
        "stores": List<dynamic>.from(stores!.map((x) => x.toJson())),
        "developers": List<dynamic>.from(developers!.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "publishers": List<dynamic>.from(publishers!.map((x) => x.toJson())),
        "esrb_rating": esrbRating!.toJson(),
      };
}

class Developer {
  Developer({
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
  String? domain;
  Language? language;

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
        domain: json["domain"] == null ? null : json["domain"],
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
        // ignore: prefer_if_null_operators
        "domain": domain == null ? null : domain,
        "language": language == null ? null : languageValues.reverse[language],
      };
}

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

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

class Requirements {
  Requirements({
    this.minimum,
    this.recommended,
  });

  String? minimum;
  String? recommended;

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"] == null ? null : json["minimum"],
        recommended: json["recommended"] == null ? null : json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum == null ? null : minimum,
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
  String? title;
  int? count;
  double? percent;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
      };
}

class Store {
  Store({
    this.id,
    this.url,
    this.store,
  });

  int? id;
  String? url;
  Developer? store;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        url: json["url"],
        store: Developer.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
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
