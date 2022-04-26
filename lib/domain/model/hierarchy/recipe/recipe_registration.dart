import 'package:cueue/domain/model/hierarchy/content/content_key.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_registration.freezed.dart';

@freezed
class RecipeRegistration with _$RecipeRegistration {
  const factory RecipeRegistration({
    required String title,
    required String description,
    required Uri? url,
    required List<ContentKey> imageKeys,
    required List<TagId> tagIds,
  }) = _RecipeRegistration;
}
