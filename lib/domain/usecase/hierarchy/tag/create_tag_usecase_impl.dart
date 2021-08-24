import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';
import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/create_tag_usecase.dart';

class CreateTagUseCaseImpl implements CreateTagUseCase {
  const CreateTagUseCaseImpl(this._tagsRepository);

  final TagRepository _tagsRepository;

  @override
  Future<void> call(final TagRegistration tagRegistration) {
    return _tagsRepository.create(tagRegistration);
  }
}
