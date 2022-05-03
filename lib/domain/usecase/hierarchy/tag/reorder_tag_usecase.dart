import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';

abstract class ReorderTagUseCase {
  Future<void> call(List<TagId> tagIds);
}
