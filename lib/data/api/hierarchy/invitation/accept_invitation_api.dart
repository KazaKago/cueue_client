import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/user/user_response.dart';
import 'package:dio/dio.dart';

class AcceptInvitationApi {
  const AcceptInvitationApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<UserResponse> execute(String code) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.patch<Map<String, dynamic>>('/invitations/$code/accept');
      return UserResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
