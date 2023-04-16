import 'package:cueue/api/response/error/error_response.dart';
import 'package:cueue/model/exception/client_error_exception.dart';
import 'package:cueue/model/exception/conflict_exception.dart';
import 'package:cueue/model/exception/invalid_params_exception.dart';
import 'package:cueue/model/exception/invalid_token_exception.dart';
import 'package:cueue/model/exception/network_cancel_exception.dart';
import 'package:cueue/model/exception/network_exception.dart';
import 'package:cueue/model/exception/network_timeout_exception.dart';
import 'package:cueue/model/exception/not_found_exception.dart';
import 'package:cueue/model/exception/server_error_exception.dart';
import 'package:cueue/model/exception/service_unavailable_exception.dart';
import 'package:cueue/model/exception/upgrade_required_exception.dart';
import 'package:dio/dio.dart';
import 'package:universal_io/io.dart';

extension ErrorClassifier on DioError {
  Exception parseException() {
    switch (type) {
      case DioErrorType.connectionError:
        return const NetworkException();
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return const NetworkTimeoutException();
      case DioErrorType.badCertificate:
        return const InvalidTokenException();
      case DioErrorType.badResponse:
        switch (response?.statusCode) {
          case HttpStatus.badRequest:
            final dynamic data = response?.data;
            if (data is List<dynamic>) {
              final entity = ErrorResponse.fromJson(data.first as Map<String, dynamic>);
              switch (entity.name) {
                case 'invalid_params':
                  return InvalidParamsException(entity.message);
              }
            }
            return const ClientErrorException();
          case HttpStatus.unauthorized:
            return const InvalidTokenException();
          case HttpStatus.notFound:
            return const NotFoundException();
          case HttpStatus.requestTimeout:
            return const NetworkTimeoutException();
          case HttpStatus.conflict:
            return const ConflictException();
          case HttpStatus.upgradeRequired:
            return const UpgradeRequiredException();
          case HttpStatus.serviceUnavailable:
            return const ServiceUnavailableException();
          case HttpStatus.gatewayTimeout:
            return const NetworkTimeoutException();
        }
        if (500 <= (response?.statusCode ?? 0)) {
          return const ServerErrorException();
        }
        return const ClientErrorException();
      case DioErrorType.cancel:
        return const NetworkCancelException();
      case DioErrorType.unknown:
        return error! as Exception;
    }
  }
}
