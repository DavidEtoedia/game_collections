import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:game_collections/Data/model/error_res.dart';
import 'package:game_collections/Data/model/games.dart';
import 'package:game_collections/constants/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../model/gamez.dart';

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
    final url = "games?key=${Constant.apiKey}&page=$page&page_size=20";

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

  Future<List<Res>> getResult(int page) async {
    final url = "games?key=${Constant.apiKey}&page=$page";

    try {
      final response = await _dio.get(url);
      final res =
          List<Res>.from(response.data.map((x) => Res.fromJson(response.data)));
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
}
