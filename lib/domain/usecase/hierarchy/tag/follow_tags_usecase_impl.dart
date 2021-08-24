import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowTagsUseCaseImpl implements FollowTagsUseCase {
  const FollowTagsUseCaseImpl(this._tagsRepository);

  final TagRepository _tagsRepository;

  @override
  LoadingStateStream<List<Tag>> call() {
    return _tagsRepository.follow();
  }
}
