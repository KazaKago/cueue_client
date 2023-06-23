import 'package:cueue/legacy/data/repository/flowable/tag/tag_flowable_factory.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:store_flowable/store_flowable.dart';

class TagRepositoryImpl implements TagRepository {
  const TagRepositoryImpl(this._tagFlowableFactory);

  final TagFlowableFactory _tagFlowableFactory;

  @override
  LoadingStateStream<List<Tag>> follow() {
    final tagFlowable = _tagFlowableFactory.create(null);
    return tagFlowable.publish();
  }

  @override
  Future<void> refresh() async {
    final tagFlowable = _tagFlowableFactory.create(null);
    return tagFlowable.refresh();
  }
}
