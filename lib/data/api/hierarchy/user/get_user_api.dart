import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/user/user_response.dart';
import 'package:dio/dio.dart';

class GetUserApi {
  const GetUserApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<UserResponse> execute() async {
    try {
      final response = await _requester.create().get<Map<String, dynamic>>('/users');
      return UserResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
