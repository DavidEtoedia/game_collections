import 'package:dio/dio.dart';
import 'package:game_collections/Data/utils/http_string_utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpUtils {
  static final BaseOptions options = BaseOptions(
    connectTimeout: 999990,
    receiveTimeout: 89250,
  );

  static Dio getInstance() {
    Dio dio = Dio(options)
      ..interceptors.add(PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: false,
          compact: false,
          error: true,
          maxWidth: 90));
    return dio;
  }

  static Future<DioError> buildErrorResponse(DioError err) async {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.sendTimeout:
        err.error = HttpErrorStrings.SEND_TIMEOUT;
        break;
      case DioErrorType.receiveTimeout:
        err.error = HttpErrorStrings.RECEIVE_TIMEOUT;
        break;
      default:
        err.error = HttpErrorStrings.UNKNOWN;
        break;
    }

    return err;
  }
}
