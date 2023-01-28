import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class TagRepository {
  LoadingStateStream<List<Tag>> follow();

  Future<void> refresh();

  Future<void> reorder(List<TagId> tagIds);
}
