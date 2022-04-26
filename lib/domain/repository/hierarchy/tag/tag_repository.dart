import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class TagRepository {
  LoadingStateStream<List<Tag>> follow();

  Future<void> refresh();

  Future<void> create(TagRegistration tagRegistration);

  Future<void> update(TagId tagId, TagRegistration tagRegistration);

  Future<void> delete(TagId tagId);
}
