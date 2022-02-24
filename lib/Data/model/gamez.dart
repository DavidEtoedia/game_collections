import 'package:json_annotation/json_annotation.dart';

part 'gamez.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Game {
  const Game({
    this.count,
    this.next,
    this.previous,
    required this.results,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoH1,
    this.noindex,
    this.nofollow,
    this.description,
    this.filters,
    this.nofollowCollections,
  });

  final int? count;
  final String? next;
  final int? previous;
  final List<Res> results;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeywords;
  final String? seoH1;
  final bool? noindex;
  final bool? nofollow;
  final String? description;
  final Filters? filters;
  final List<String>? nofollowCollections;

  static const empty = Game(
    count: 0,
    next: '',
    previous: 0,
    results: [],
    seoTitle: '',
    seoDescription: '',
    seoKeywords: '',
    seoH1: '',
    noindex: false,
    nofollow: false,
    description: '',
    filters: Filters(years: []),
    nofollowCollections: [],
  );

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Res {
  Res({
    required this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
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
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  final int id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? metacritic;
  final int? playtime;
  final int? suggestionsCount;
  final DateTime? updated;
  final String? userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<PlatformElement>? platforms;
  final List<ParentPlatform>? parentPlatforms;
  final List<Genre>? genres;
  final List<Store>? stores;
  final String? clip;
  final List<Genre>? tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenshot>? shortScreenshots;

  factory Res.fromJson(Map<String, dynamic> json) => _$ResFromJson(json);
}

@JsonSerializable()
class AddedByStatus {
  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  final int? yet;
  final int? owned;
  final int? beaten;
  final int? toplay;
  final int? dropped;
  final int? playing;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) =>
      _$AddedByStatusFromJson(json);
}

@JsonSerializable()
class EsrbRating {
  EsrbRating({
    this.id,
    this.name,
    this.slug,
  });

  final int? id;
  final String? name;
  final String? slug;

  factory EsrbRating.fromJson(Map<String, dynamic> json) =>
      _$EsrbRatingFromJson(json);
}

@JsonSerializable()
class Filters {
  const Filters({
    this.years,
  });

  final List<FiltersYear>? years;

  factory Filters.fromJson(Map<String, dynamic> json) =>
      _$FiltersFromJson(json);
}

@JsonSerializable()
class FiltersYear {
  FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });

  final int? from;
  final int? to;
  final String? filter;
  final int? decade;
  final List<YearGame>? years;
  final bool? nofollow;
  final int? count;

  factory FiltersYear.fromJson(Map<String, dynamic> json) =>
      _$FiltersYearFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  Genre({
    required this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  final int id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? domain;
  final String? language;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  final EsrbRating? platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) =>
      _$ParentPlatformFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
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

  final int? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? yearEnd;
  final int? yearStart;
  final int? gamesCount;
  final String? imageBackground;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      _$PlatformPlatformFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PlatformElement {
  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  final PlatformPlatform? platform;
  final DateTime? releasedAt;
  final Requirements? requirementsEn;
  final Requirements? requirementsRu;

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      _$PlatformElementFromJson(json);
}

@JsonSerializable()
class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@JsonSerializable()
class ShortScreenshot {
  ShortScreenshot({
    this.id,
    this.image,
  });

  final int? id;
  final String? image;

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      _$ShortScreenshotFromJson(json);
}

@JsonSerializable()
class Store {
  Store({
    this.id,
    this.store,
  });

  final int? id;
  final Genre? store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}

@JsonSerializable()
class YearGame {
  const YearGame({
    this.year,
    this.count,
    this.nofollow,
  });

  final int? year;
  final int? count;
  final bool? nofollow;

  factory YearGame.fromJson(Map<String, dynamic> json) =>
      _$YearGameFromJson(json);
}

@JsonSerializable()
class Requirements {
  Requirements({
    this.minimum,
    this.recommended,
  });

  final String? minimum;
  final String? recommended;

  factory Requirements.fromJson(Map<String, dynamic> json) =>
      _$RequirementsFromJson(json);
}
