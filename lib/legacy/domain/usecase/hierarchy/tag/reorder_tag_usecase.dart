import 'package:cueue/model/tag/tag_id.dart';

abstract class ReorderTagUseCase {
  Future<void> call(List<TagId> tagIds);
}
