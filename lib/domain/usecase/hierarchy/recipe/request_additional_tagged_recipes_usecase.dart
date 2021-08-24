import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';

abstract class RequestAdditionalTaggedRecipesUseCase {
  Future<void> call(final TagId tagId, {required final bool continueWhenError});
}
