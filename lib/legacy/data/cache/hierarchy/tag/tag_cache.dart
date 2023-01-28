import 'package:cueue/legacy/data/cache/hierarchy/cache.dart';
import 'package:cueue/model/tag/tag.dart';

class TagCache implements Cache {
  List<Tag>? tags;
  DateTime? tagsCreatedAt;

  @override
  void clearAll() {
    tags = null;
    tagsCreatedAt = null;
  }
}
