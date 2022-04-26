import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';

abstract class RefreshTaggedRecipesUseCase {
  Future<void> call(TagId tagId);
}
