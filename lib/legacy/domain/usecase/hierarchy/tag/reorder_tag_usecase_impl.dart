import 'package:cueue/legacy/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/reorder_tag_usecase.dart';
import 'package:cueue/model/tag/tag_id.dart';

class ReorderTagUseCaseImpl implements ReorderTagUseCase {
  const ReorderTagUseCaseImpl(this._tagsRepository);

  final TagRepository _tagsRepository;

  @override
  Future<void> call(List<TagId> tagIds) {
    return _tagsRepository.reorder(tagIds);
  }
}
