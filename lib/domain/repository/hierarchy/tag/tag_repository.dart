import 'package:cueue/domain/model/hierarchy/tag/tag.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_registration.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class TagRepository {
  Future<LoadingStateStream<List<Tag>>> follow();

  Future<void> refresh();

  Future<void> create(final TagRegistration tagRegistration);

  Future<void> update(final TagId tagId, final TagRegistration tagRegistration);

  Future<void> delete(final TagId tagId);
}
