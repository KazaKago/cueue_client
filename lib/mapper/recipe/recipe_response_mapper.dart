import 'package:cueue/api/response/recipe/recipe_response.dart';
import 'package:cueue/mapper/content/content_response_mapper.dart';
import 'package:cueue/mapper/tag/tag_response_mapper.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';

class RecipeResponseMapper {
  const RecipeResponseMapper(this._tagResponseMapper, this._contentResponseMapper);

  final TagResponseMapper _tagResponseMapper;
  final ContentResponseMapper _contentResponseMapper;

  Recipe map(RecipeResponse response) {
    return Recipe(
      id: RecipeId(response.id),
      title: response.title,
      description: response.description,
      url: (response.url != null) ? Uri.parse(response.url!) : null,
      images: response.images.map(_contentResponseMapper.call).toList(),
      tags: response.tags.map(_tagResponseMapper.call).toList(),
      cookingHistories: response.cookingHistories.map(DateTime.parse).toList(),
      cookingCount: response.cookingCount,
      createdAt: DateTime.parse(response.createdAt),
      updatedAt: DateTime.parse(response.updatedAt),
    );
  }
}
