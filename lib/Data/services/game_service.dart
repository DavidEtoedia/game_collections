import 'package:dio/dio.dart';
import 'package:game_collections/Data/error/error_res.dart';
import 'package:game_collections/Data/model/creators.dart';
import 'package:game_collections/Data/model/game_detail.dart';
import 'package:game_collections/Data/model/game_screenshots.dart';
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
    const url = "games?key=${Constant.apiKey}&page=2&genre=action";

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

  Future<Creators> getCreators() async {
    const url = "creators?key=${Constant.apiKey}&page=2";

    try {
      final response = await _dio.get(url);
      final res = Creators.fromJson(response.data);
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

  Future<Games> getSingleGame() async {
    const url = "games?key=${Constant.apiKey}&page=2&genre=action";

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

  Future<GameDetails> getGameDetail(int id) async {
    final url = "games/$id?key=${Constant.apiKey}";

    try {
      final response = await _dio.get(url);
      final res = GameDetails.fromJson(response.data);
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

  Future<GameScreenShots> getScreenShot(String screenShotId) async {
    final url = "games/$screenShotId/screenshots?key=${Constant.apiKey}";

    try {
      final response = await _dio.get(url);
      final res = GameScreenShots.fromJson(response.data);
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
