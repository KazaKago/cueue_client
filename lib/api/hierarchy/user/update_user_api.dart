import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/request/user/user_request.dart';
import 'package:cueue/api/response/user/user_response.dart';
import 'package:dio/dio.dart';

class UpdateUserApi {
  const UpdateUserApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<UserResponse> call(UserRequest request) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.put<Map<String, dynamic>>('/users/me', data: request);
      return UserResponse.fromJson(response.data!);
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
