import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/user/user_response.dart';
import 'package:dio/dio.dart';

class AcceptInvitationApi {
  const AcceptInvitationApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<UserResponse> call(String code) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.patch<Map<String, dynamic>>('/invitations/$code/accept');
      return UserResponse.fromJson(response.data!);
    } on DioException catch (dioError) {
      throw dioError.parseException();
    }
  }
}
