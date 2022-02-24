// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gamez.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Res.fromJson(e as Map<String, dynamic>))
          .toList(),
      seoTitle: json['seo_title'] as String?,
      seoDescription: json['seo_description'] as String?,
      seoKeywords: json['seo_keywords'] as String?,
      seoH1: json['seo_h1'] as String?,
      noindex: json['noindex'] as bool?,
      nofollow: json['nofollow'] as bool?,
      description: json['description'] as String?,
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(json['filters'] as Map<String, dynamic>),
      nofollowCollections: (json['nofollow_collections'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
      'seo_title': instance.seoTitle,
      'seo_description': instance.seoDescription,
      'seo_keywords': instance.seoKeywords,
      'seo_h1': instance.seoH1,
      'noindex': instance.noindex,
      'nofollow': instance.nofollow,
      'description': instance.description,
      'filters': instance.filters,
      'nofollow_collections': instance.nofollowCollections,
    };

Res _$ResFromJson(Map<String, dynamic> json) => Res(
      id: json['id'] as int,
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      released: json['released'] == null
          ? null
          : DateTime.parse(json['released'] as String),
      tba: json['tba'] as bool?,
      backgroundImage: json['background_image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingTop: json['rating_top'] as int?,
      ratings: (json['ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingsCount: json['ratings_count'] as int?,
      reviewsTextCount: json['reviews_text_count'] as int?,
      added: json['added'] as int?,
      addedByStatus: json['added_by_status'] == null
          ? null
          : AddedByStatus.fromJson(
              json['added_by_status'] as Map<String, dynamic>),
      metacritic: json['metacritic'] as int?,
      playtime: json['playtime'] as int?,
      suggestionsCount: json['suggestions_count'] as int?,
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      userGame: json['user_game'] as String?,
      reviewsCount: json['reviews_count'] as int?,
      saturatedColor: json['saturated_color'] as String?,
      dominantColor: json['dominant_color'] as String?,
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => PlatformElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentPlatforms: (json['parent_platforms'] as List<dynamic>?)
          ?.map((e) => ParentPlatform.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>?)
          ?.map((e) => Store.fromJson(e as Map<String, dynamic>))
          .toList(),
      clip: json['clip'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      esrbRating: json['esrb_rating'] == null
          ? null
          : EsrbRating.fromJson(json['esrb_rating'] as Map<String, dynamic>),
      shortScreenshots: (json['short_screenshots'] as List<dynamic>?)
          ?.map((e) => ShortScreenshot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResToJson(Res instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'released': instance.released?.toIso8601String(),
      'tba': instance.tba,
      'background_image': instance.backgroundImage,
      'rating': instance.rating,
      'rating_top': instance.ratingTop,
      'ratings': instance.ratings,
      'ratings_count': instance.ratingsCount,
      'reviews_text_count': instance.reviewsTextCount,
      'added': instance.added,
      'added_by_status': instance.addedByStatus,
      'metacritic': instance.metacritic,
      'playtime': instance.playtime,
      'suggestions_count': instance.suggestionsCount,
      'updated': instance.updated?.toIso8601String(),
      'user_game': instance.userGame,
      'reviews_count': instance.reviewsCount,
      'saturated_color': instance.saturatedColor,
      'dominant_color': instance.dominantColor,
      'platforms': instance.platforms,
      'parent_platforms': instance.parentPlatforms,
      'genres': instance.genres,
      'stores': instance.stores,
      'clip': instance.clip,
      'tags': instance.tags,
      'esrb_rating': instance.esrbRating,
      'short_screenshots': instance.shortScreenshots,
    };

AddedByStatus _$AddedByStatusFromJson(Map<String, dynamic> json) =>
    AddedByStatus(
      yet: json['yet'] as int?,
      owned: json['owned'] as int?,
      beaten: json['beaten'] as int?,
      toplay: json['toplay'] as int?,
      dropped: json['dropped'] as int?,
      playing: json['playing'] as int?,
    );

Map<String, dynamic> _$AddedByStatusToJson(AddedByStatus instance) =>
    <String, dynamic>{
      'yet': instance.yet,
      'owned': instance.owned,
      'beaten': instance.beaten,
      'toplay': instance.toplay,
      'dropped': instance.dropped,
      'playing': instance.playing,
    };

EsrbRating _$EsrbRatingFromJson(Map<String, dynamic> json) => EsrbRating(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$EsrbRatingToJson(EsrbRating instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      years: (json['years'] as List<dynamic>?)
          ?.map((e) => FiltersYear.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'years': instance.years,
    };

FiltersYear _$FiltersYearFromJson(Map<String, dynamic> json) => FiltersYear(
      from: json['from'] as int?,
      to: json['to'] as int?,
      filter: json['filter'] as String?,
      decade: json['decade'] as int?,
      years: (json['years'] as List<dynamic>?)
          ?.map((e) => YearGame.fromJson(e as Map<String, dynamic>))
          .toList(),
      nofollow: json['nofollow'] as bool?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$FiltersYearToJson(FiltersYear instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'filter': instance.filter,
      'decade': instance.decade,
      'years': instance.years,
      'nofollow': instance.nofollow,
      'count': instance.count,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      id: json['id'] as int,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      gamesCount: json['games_count'] as int?,
      imageBackground: json['image_background'] as String?,
      domain: json['domain'] as String?,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
      'domain': instance.domain,
      'language': instance.language,
    };

ParentPlatform _$ParentPlatformFromJson(Map<String, dynamic> json) =>
    ParentPlatform(
      platform: json['platform'] == null
          ? null
          : EsrbRating.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ParentPlatformToJson(ParentPlatform instance) =>
    <String, dynamic>{
      'platform': instance.platform,
    };

PlatformPlatform _$PlatformPlatformFromJson(Map<String, dynamic> json) =>
    PlatformPlatform(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      yearEnd: json['year_end'] as String?,
      yearStart: json['year_start'] as int?,
      gamesCount: json['games_count'] as int?,
      imageBackground: json['image_background'] as String?,
    );

Map<String, dynamic> _$PlatformPlatformToJson(PlatformPlatform instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
      'year_end': instance.yearEnd,
      'year_start': instance.yearStart,
      'games_count': instance.gamesCount,
      'image_background': instance.imageBackground,
    };

PlatformElement _$PlatformElementFromJson(Map<String, dynamic> json) =>
    PlatformElement(
      platform: json['platform'] == null
          ? null
          : PlatformPlatform.fromJson(json['platform'] as Map<String, dynamic>),
      releasedAt: json['released_at'] == null
          ? null
          : DateTime.parse(json['released_at'] as String),
      requirementsEn: json['requirements_en'] == null
          ? null
          : Requirements.fromJson(
              json['requirements_en'] as Map<String, dynamic>),
      requirementsRu: json['requirements_ru'] == null
          ? null
          : Requirements.fromJson(
              json['requirements_ru'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformElementToJson(PlatformElement instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'released_at': instance.releasedAt?.toIso8601String(),
      'requirements_en': instance.requirementsEn,
      'requirements_ru': instance.requirementsRu,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      id: json['id'] as int?,
      title: json['title'] as String?,
      count: json['count'] as int?,
      percent: (json['percent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
    };

ShortScreenshot _$ShortScreenshotFromJson(Map<String, dynamic> json) =>
    ShortScreenshot(
      id: json['id'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ShortScreenshotToJson(ShortScreenshot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      id: json['id'] as int?,
      store: json['store'] == null
          ? null
          : Genre.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'id': instance.id,
      'store': instance.store,
    };

YearGame _$YearGameFromJson(Map<String, dynamic> json) => YearGame(
      year: json['year'] as int?,
      count: json['count'] as int?,
      nofollow: json['nofollow'] as bool?,
    );

Map<String, dynamic> _$YearGameToJson(YearGame instance) => <String, dynamic>{
      'year': instance.year,
      'count': instance.count,
      'nofollow': instance.nofollow,
    };

Requirements _$RequirementsFromJson(Map<String, dynamic> json) => Requirements(
      minimum: json['minimum'] as String?,
      recommended: json['recommended'] as String?,
    );

Map<String, dynamic> _$RequirementsToJson(Requirements instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'recommended': instance.recommended,
    };
