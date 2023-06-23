import 'package:cueue/model/tag/tag.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class TagRepository {
  LoadingStateStream<List<Tag>> follow();

  Future<void> refresh();
}
