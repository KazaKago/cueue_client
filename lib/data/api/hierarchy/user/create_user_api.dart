import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/user/user_response.dart';
import 'package:dio/dio.dart';

class CreateUserApi {
  const CreateUserApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<UserResponse> execute() async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.post<Map<String, dynamic>>('/users');
      return UserResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
