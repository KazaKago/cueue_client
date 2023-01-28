import 'package:cueue/legacy/domain/repository/hierarchy/content/content_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/content/create_content_usecase.dart';
import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/content/content_registration.dart';

class CreateContentUseCaseImpl implements CreateContentUseCase {
  const CreateContentUseCaseImpl(this._contentRepository);

  final ContentRepository _contentRepository;

  @override
  Future<Content> call(ContentRegistration contentRegistration) {
    return _contentRepository.create(contentRegistration);
  }
}
