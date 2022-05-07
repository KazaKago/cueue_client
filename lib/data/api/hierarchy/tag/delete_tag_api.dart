import 'package:cueue/data/api/global/requester/dio_creator.dart';
import 'package:cueue/data/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteTagApi {
  const DeleteTagApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> execute(int workspaceId, int tagId) async {
    try {
      final dio = await _dioCreator.create();
      await dio.delete<void>('/$workspaceId/tags/$tagId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
