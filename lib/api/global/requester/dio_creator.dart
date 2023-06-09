import 'package:cueue/api/global/entity/api_base_url.dart';
import 'package:cueue/api/global/entity/api_version.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:universal_io/io.dart';

abstract class DioCreator {
  Future<String> loadToken();

  Future<Dio> create() async {
    final dio = Dio()..options = await _createBaseOption();
    dio.interceptors.add(_createInterceptor(dio));
    return dio;
  }

  Future<BaseOptions> _createBaseOption() async {
    // final appCheckToken = await FirebaseAppCheck.instance.getToken();
    return BaseOptions(
      baseUrl: const ApiBaseUrl().value.toString(),
      headers: <String, dynamic>{
        'Api-Version': const ApiVersion().value,
        // 'AppCheck-Token': appCheckToken,
        HttpHeaders.contentTypeHeader: ContentType.json.value,
      },
    );
  }

  InterceptorsWrapper _createInterceptor(Dio dio) {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        try {
          final accessToken = await loadToken();
          options.headers.addAll(<String, dynamic>{HttpHeaders.authorizationHeader: 'Bearer $accessToken'});
          handler.next(options);
        } on Exception catch (exception) {
          handler.reject(DioException(requestOptions: options, error: exception));
        }
      },
      onError: (DioException error, ErrorInterceptorHandler handler) {
        final newError = error.copyWith(error: error.parseException());
        handler.next(newError);
      },
    );
  }
}
