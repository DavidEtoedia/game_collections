import 'package:dio/dio.dart';
import 'package:game_collections/Data/model/news.dart';
import 'package:game_collections/Data/services/news_service.dart';

class NewsRepository {
  final NewsService newsService;
  NewsRepository({
    required this.newsService,
  });

  Future<News> getNews() async => newsService.getNews();
}
