import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class CreateUserApi {
  const CreateUserApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> execute() async {
    try {
      final dio = await _dioCreator.create();
      await dio.post<void>('/users');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
