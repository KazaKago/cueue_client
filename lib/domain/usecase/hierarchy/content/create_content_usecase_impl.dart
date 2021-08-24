import 'package:cueue/domain/model/hierarchy/content/content.dart';
import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/repository/hierarchy/content/content_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/content/create_content_usecase.dart';

class CreateContentUseCaseImpl implements CreateContentUseCase {
  const CreateContentUseCaseImpl(this._contentRepository);

  final ContentRepository _contentRepository;

  @override
  Future<Content> call(final ContentRegistration contentRegistration) {
    return _contentRepository.create(contentRegistration);
  }
}
