import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteTagApi {
  const DeleteTagApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> call(int tagId) async {
    try {
      final dio = await _dioCreator.create();
      await dio.delete<void>('/tags/$tagId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
