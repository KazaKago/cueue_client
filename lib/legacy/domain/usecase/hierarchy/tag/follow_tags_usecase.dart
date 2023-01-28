import 'package:cueue/model/tag/tag.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class FollowTagsUseCase {
  LoadingStateStream<List<Tag>> call();
}
