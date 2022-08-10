import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:cueue/data/api/response/invitation/invitation_response.dart';
import 'package:dio/dio.dart';

class CreateInvitationApi {
  const CreateInvitationApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<InvitationResponse> execute() async {
    try {
      final dio = await _dioCreator.create();
      final response = await dio.post<Map<String, dynamic>>('/invitations');
      return InvitationResponse.fromJson(response.data!);
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
