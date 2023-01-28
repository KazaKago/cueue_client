import 'dart:typed_data';

import 'package:cueue/api/hierarchy/content/create_content_api.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/content/content_repository.dart';
import 'package:cueue/mapper/content/content_request_mapper.dart';
import 'package:cueue/mapper/content/content_response_mapper.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_registration.dart';
import 'package:dio/dio.dart';

class ContentRepositoryImpl implements ContentRepository {
  const ContentRepositoryImpl(this._createContentApi, this._contentRequestMapper, this._contentResponseMapper);

  final CreateContentApi _createContentApi;
  final ContentRequestMapper _contentRequestMapper;
  final ContentResponseMapper _contentResponseMapper;

  @override
  Future<Content> create(ContentRegistration contentRegistration) async {
    final request = await _contentRequestMapper(contentRegistration, (uri) async {
      final dio = Dio();
      final response = await dio.getUri<List<int>>(uri, options: Options(responseType: ResponseType.bytes));
      return Uint8List.fromList(response.data!);
    });
    final response = await _createContentApi(request);
    return _contentResponseMapper(response);
  }
}
