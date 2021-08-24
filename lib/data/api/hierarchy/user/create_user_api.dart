import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class CreateUserApi {
  const CreateUserApi(this._requester);

  final AuthorizedApiRequester _requester;

  Future<void> execute() async {
    try {
      await _requester.create().post<void>('/users');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
