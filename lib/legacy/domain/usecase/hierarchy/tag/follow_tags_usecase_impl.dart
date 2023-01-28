import 'package:cueue/legacy/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowTagsUseCaseImpl implements FollowTagsUseCase {
  const FollowTagsUseCaseImpl(this._tagsRepository);

  final TagRepository _tagsRepository;

  @override
  LoadingStateStream<List<Tag>> call() {
    return _tagsRepository.follow();
  }
}
