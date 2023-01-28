import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:cueue/api/response/invitation/invitation_response.dart';
import 'package:dio/dio.dart';

class GetInvitationApi {
  const GetInvitationApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<InvitationResponse> call(String code) async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.get<Map<String, dynamic>>('/invitations/$code');
      return InvitationResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
