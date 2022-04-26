import 'package:cueue/data/api/hierarchy/content/create_content_api.dart';
import 'package:cueue/data/mapper/hierarchy/content/content_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/content/content_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/repository/hierarchy/content/content_repository.dart';

class ContentRepositoryImpl implements ContentRepository {
  const ContentRepositoryImpl(this._createContentApi, this._contentRequestMapper, this._contentResponseMapper);

  final CreateContentApi _createContentApi;
  final ContentRequestMapper _contentRequestMapper;
  final ContentResponseMapper _contentResponseMapper;

  @override
  Future<Content> create(ContentRegistration contentRegistration) async {
    final response = await _createContentApi.execute(_contentRequestMapper.map(contentRegistration));
    return _contentResponseMapper.map(response);
  }
}
