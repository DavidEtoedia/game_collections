import 'package:dio/dio.dart';
import 'package:game_collections/Data/model/new_error.dart';
import 'package:game_collections/Data/model/news.dart';
import 'package:game_collections/constants/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsService {
  final Dio _dio;
  NewsService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
                receiveTimeout: 100000,
                connectTimeout: 100000,
                baseUrl: Constant.apiUrl)) {
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<News> getNews() async {
    const url =
        "top-headlines?country=us&apiKey=4afd7897032e43419f559a8308a7d094";

    try {
      final response = await _dio.get(url);
      final res = News.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data == "") {
        ErrorRes result = ErrorRes.fromJson(e.response!.data);
        throw result.message!;
      } else {
        throw e.error;
      }
    }
  }
}
