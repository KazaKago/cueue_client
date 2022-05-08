import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteUserApi {
  const DeleteUserApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> execute() async {
    try {
      final dio = await _dioCreator.create();
      await dio.delete<void>('/user');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
