import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class CreateUserApi {
  const CreateUserApi(this._dio);

  final Dio _dio;

  Future<void> execute() async {
    try {
      await _dio.post<void>('/users');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
