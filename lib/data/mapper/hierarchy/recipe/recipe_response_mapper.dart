import 'package:cueue/data/api/response/recipe/recipe_response.dart';
import 'package:cueue/data/mapper/hierarchy/content/content_response_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/tag/tag_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';

class RecipeResponseMapper {
  const RecipeResponseMapper(this._tagResponseMapper, this._contentResponseMapper);

  final TagResponseMapper _tagResponseMapper;
  final ContentResponseMapper _contentResponseMapper;

  Recipe map(final RecipeResponse response) {
    return Recipe(
      id: RecipeId(response.id),
      title: response.title,
      description: response.description,
      url: (response.url != null) ? Uri.parse(response.url!) : null,
      images: response.images.map(_contentResponseMapper.map).toList(),
      tags: response.tags.map(_tagResponseMapper.map).toList(),
      cookingHistories: response.cookingHistories.map(DateTime.parse).toList(),
      cookingCount: response.cookingCount,
      createdAt: DateTime.parse(response.createdAt),
      updatedAt: DateTime.parse(response.updatedAt),
    );
  }
}
