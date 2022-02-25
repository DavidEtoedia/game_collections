import 'package:dio/dio.dart';
import 'package:game_collections/Data/error/error_res.dart';
import 'package:game_collections/Data/model/game_release.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/constants/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GamesService {
  final Dio _dio;
  GamesService({Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
                receiveTimeout: 100000,
                connectTimeout: 100000,
                baseUrl: Constant.gamesUrl)) {
    _dio.interceptors.add(PrettyDioLogger());
  }

  Future<Games> getGames(int page) async {
    final url = "games?key=${Constant.apiKey}&page=$page&genre=action";

    try {
      final response = await _dio.get(url);
      final res = Games.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data == "") {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!;
      } else {
        print(e.error);
        throw e.error;
      }
    }
  }

  Future<Games> latestRelease() async {
    const url = "games?key=${Constant.apiKey}&page=5&genre=action";

    try {
      final response = await _dio.get(url);
      final res = Games.fromJson(response.data);
      return res;
    } on DioError catch (e) {
      if (e.response != null && e.response!.data == "") {
        Failure result = Failure.fromJson(e.response!.data);
        throw result.error!;
      } else {
        throw e.error;
      }
    }
  }
}
