import 'package:cueue/domain/model/hierarchy/tag/tag.dart';

class TagCache {
  static TagCache sharedInstance = TagCache();

  List<Tag>? tags;
  DateTime? tagsCreatedAt;

  void clearAll() {
    tags = null;
    tagsCreatedAt = null;
  }
}
