import 'package:cueue/api/global/requester/dio_creator.dart';
import 'package:cueue/api/global/requester/error_classifier.dart';
import 'package:dio/dio.dart';

class DeleteMenuApi {
  const DeleteMenuApi(this._dioCreator);

  final DioCreator _dioCreator;

  Future<void> call(int menuId) async {
    try {
      final dio = await _dioCreator.create();
      await dio.delete<void>('/menus/$menuId');
    } on DioError catch (dioError) {
      throw dioError.parseException();
    }
  }
}
