import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowTagsUseCase {
  Future<LoadingStateStream<List<Tag>>> call();
}
