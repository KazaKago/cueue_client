import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/reorder_tag_usecase.dart';

class ReorderTagUseCaseImpl implements ReorderTagUseCase {
  const ReorderTagUseCaseImpl(this._tagsRepository);

  final TagRepository _tagsRepository;

  @override
  Future<void> call(List<TagId> tagIds) {
    return _tagsRepository.reorder(tagIds);
  }
}
