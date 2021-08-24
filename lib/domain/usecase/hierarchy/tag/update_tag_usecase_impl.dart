import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';
import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/update_tag_usecase.dart';

class UpdateTagUseCaseImpl implements UpdateTagUseCase {
  const UpdateTagUseCaseImpl(this._tagsRepository);

  final TagRepository _tagsRepository;

  @override
  Future<void> call(final TagId tagId, final TagRegistration tagRegistration) {
    return _tagsRepository.update(tagId, tagRegistration);
  }
}
