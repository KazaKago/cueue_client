import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/delete_tag_usecase.dart';

class DeleteTagUseCaseImpl implements DeleteTagUseCase {
  const DeleteTagUseCaseImpl(this._tagsRepository);

  final TagRepository _tagsRepository;

  @override
  Future<void> call(final TagId tagId) {
    return _tagsRepository.delete(tagId);
  }
}
