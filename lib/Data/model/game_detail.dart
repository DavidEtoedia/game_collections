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
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
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
    this.additionsCount,
    this.gameSeriesCount,
    this.reviewsCount,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.descriptionRaw,
  });

  int? id;
  String? slug;
  String? name;
  String? nameOriginal;
  String? description;
  int? metacritic;
  List<MetacriticPlatform>? metacriticPlatforms;
  DateTime? released;
  DateTime? updated;
  String? backgroundImage;
  String? backgroundImageAdditional;
  String? website;
  double? rating;
  int? ratingTop;
  List<Rating>? ratings;
  Reactions? reactions;
  int? playtime;
  int? screenshotsCount;
  int? moviesCount;
  int? creatorsCount;
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
  int? additionsCount;
  int? gameSeriesCount;
  int? reviewsCount;
  List<PlatformElement>? platforms;
  List<dynamic>? stores;
  List<dynamic>? developers;
  List<Genre>? genres;
  List<Genre>? tags;
  List<Genre>? publishers;
  EsrbRating? esrbRating;
  String? descriptionRaw;

  factory GameDetails.fromJson(Map<String, dynamic> json) => GameDetails(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        metacriticPlatforms: List<MetacriticPlatform>.from(
            json["metacritic_platforms"]
                .map((x) => MetacriticPlatform.fromJson(x))),
        released: DateTime.parse(json["released"]),
        updated: DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"].toDouble(),
        ratingTop: json["rating_top"],
        ratings:
            List<Rating>.from(json["ratings"].map((x) => Rating.fromJson(x))),
        reactions: Reactions.fromJson(json["reactions"]),
        playtime: json["playtime"],
        screenshotsCount: json["screenshots_count"],
        moviesCount: json["movies_count"],
        creatorsCount: json["creators_count"],
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
        additionsCount: json["additions_count"],
        gameSeriesCount: json["game_series_count"],
        reviewsCount: json["reviews_count"],
        platforms: List<PlatformElement>.from(
            json["platforms"].map((x) => PlatformElement.fromJson(x))),
        stores: List<dynamic>.from(json["stores"].map((x) => x)),
        developers: List<dynamic>.from(json["developers"].map((x) => x)),
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        tags: List<Genre>.from(json["tags"].map((x) => Genre.fromJson(x))),
        publishers:
            List<Genre>.from(json["publishers"].map((x) => Genre.fromJson(x))),
        esrbRating: EsrbRating.fromJson(json["esrb_rating"]),
        descriptionRaw: json["description_raw"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "metacritic_platforms":
            List<dynamic>.from(metacriticPlatforms!.map((x) => x.toJson())),
        "released":
            "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "updated": updated!.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "reactions": reactions!.toJson(),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "creators_count": creatorsCount,
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
        "additions_count": additionsCount,
        "game_series_count": gameSeriesCount,
        "reviews_count": reviewsCount,
        "platforms": List<dynamic>.from(platforms!.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores!.map((x) => x)),
        "developers": List<dynamic>.from(developers!.map((x) => x)),
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
        "tags": List<dynamic>.from(tags!.map((x) => x.toJson())),
        "publishers": List<dynamic>.from(publishers!.map((x) => x.toJson())),
        "esrb_rating": esrbRating!.toJson(),
        "description_raw": descriptionRaw,
      };
}

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
    this.language,
  });

  int? id;
  String? name;
  String? slug;
  int? gamesCount;
  String? imageBackground;
  Language? language;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
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
        "language": language == null ? null : languageValues.reverse[language],
      };
}

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

class MetacriticPlatform {
  MetacriticPlatform({
    this.metascore,
    this.url,
    this.platform,
  });

  int? metascore;
  String? url;
  MetacriticPlatformPlatform? platform;

  factory MetacriticPlatform.fromJson(Map<String, dynamic> json) =>
      MetacriticPlatform(
        metascore: json["metascore"],
        url: json["url"],
        platform: MetacriticPlatformPlatform.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "metascore": metascore,
        "url": url,
        "platform": platform!.toJson(),
      };
}

class MetacriticPlatformPlatform {
  MetacriticPlatformPlatform({
    this.platform,
    this.name,
    this.slug,
  });

  int? platform;
  String? name;
  String? slug;

  factory MetacriticPlatformPlatform.fromJson(Map<String, dynamic> json) =>
      MetacriticPlatformPlatform(
        platform: json["platform"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "platform": platform,
        "name": name,
        "slug": slug,
      };
}

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
    this.requirements,
  });

  PlatformPlatform? platform;
  DateTime? releasedAt;
  Requirements? requirements;

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: json["platform"] == null
            ? null
            : PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null
            ? null
            : DateTime.parse(json["released_at"]),
        requirements: json["requirements"] == null
            ? null
            : Requirements.fromJson(json["requirements"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform == null ? null : platform!.toJson(),
        "released_at": releasedAt == null
            ? null
            : "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements": requirements == null ? null : requirements!.toJson(),
      };
}

class PlatformPlatform {
  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  int? id;
  String? name;
  String? slug;
  dynamic image;
  dynamic yearEnd;
  dynamic yearStart;
  int? gamesCount;
  String? imageBackground;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
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

class Reactions {
  Reactions();

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions();

  Map<String, dynamic> toJson() => {};
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
