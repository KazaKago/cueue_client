import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/user/user_response.dart';
import 'package:dio/dio.dart';

class GetUserApi {
  const GetUserApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<UserResponse> call() async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.get<Map<String, dynamic>>('/users/me');
      return UserResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
