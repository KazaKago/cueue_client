import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag.dart';

class TagCache implements Cache {
  List<Tag>? tags;
  DateTime? tagsCreatedAt;

  @override
  void clearAll() {
    tags = null;
    tagsCreatedAt = null;
  }
}
