import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';

class RefreshTagsUseCaseImpl implements RefreshTagsUseCase {
  const RefreshTagsUseCaseImpl(this._tagRepository);

  final TagRepository _tagRepository;

  @override
  Future<void> call() {
    return _tagRepository.refresh();
  }
}
