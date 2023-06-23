import 'package:cueue/legacy/data/cache/hierarchy/tag/tag_cache.dart';
import 'package:cueue/legacy/data/cache/hierarchy/tag/tag_state_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tagCacheProvider = Provider((ref) => TagCache());
final tagStateManagerProvider = Provider((ref) => TagStateManager());
final allCacheProvider = Provider(
  (ref) => [
    ref.read(tagCacheProvider),
    ref.read(tagStateManagerProvider),
  ],
);
