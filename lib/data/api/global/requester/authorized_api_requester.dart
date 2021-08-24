import 'dart:io';

import 'package:cueue/data/api/global/entity/api_base_url.dart';
import 'package:cueue/data/api/global/entity/api_version.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

abstract class AuthorizedApiRequester {
  Future<String> loadToken();

  Dio create() {
    final dio = Dio()..options = _createBaseOption();
    dio.interceptors.add(_createInterceptor(dio));
    return dio;
  }

  BaseOptions _createBaseOption() {
    return BaseOptions(
      baseUrl: const ApiBaseUrl().value.toString(),
      headers: <String, dynamic>{'Api-Version': const ApiVersion().value},
    );
  }

  InterceptorsWrapper _createInterceptor(final Dio dio) {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        try {
          final accessToken = await loadToken();
          options.headers.addAll(<String, dynamic>{HttpHeaders.authorizationHeader: 'Bearer $accessToken'});
          handler.next(options);
        } on Exception catch (exception) {
          handler.reject(DioError(requestOptions: options, error: exception));
        }
      },
      onError: (DioError error, ErrorInterceptorHandler handler) {
        error.error = error.parseException();
        handler.next(error);
      },
    );
  }
}
