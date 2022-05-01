import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/user/user_response.dart';
import 'package:dio/dio.dart';

class GetUserApi {
  const GetUserApi(this._dio);

  final Dio _dio;

  Future<UserResponse> execute() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/users');
      return UserResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
