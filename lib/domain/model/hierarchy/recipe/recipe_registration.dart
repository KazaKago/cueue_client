import 'package:cueue/domain/model/hierarchy/content/content_key.dart';
import 'package:cueue/domain/model/hierarchy/tag/tag_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_registration.freezed.dart';

@freezed
class RecipeRegistration with _$RecipeRegistration {
  const factory RecipeRegistration({
    required final String title,
    required final String description,
    required final Uri? url,
    required final List<ContentKey> imageKeys,
    required final List<TagId> tagIds,
  }) = _RecipeRegistration;
}
