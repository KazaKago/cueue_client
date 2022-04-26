import 'package:cueue/data/api/response/recipe/recipe_summary_response.dart';
import 'package:cueue/data/mapper/hierarchy/content/content_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_id.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary.dart';
import 'package:cueue/domain/model/hierarchy/recipe/recipe_summary_impl.dart';

class RecipeSummaryResponseMapper {
  const RecipeSummaryResponseMapper(this._contentResponseMapper);

  final ContentResponseMapper _contentResponseMapper;

  RecipeSummary map(RecipeSummaryResponse response) {
    final image = response.image;
    final lastCookingAt = response.lastCookingAt;
    return RecipeSummaryImpl(
      id: RecipeId(response.id),
      title: response.title,
      image: (image != null) ? _contentResponseMapper.map(image) : null,
      lastCookingAt: (lastCookingAt != null) ? DateTime.parse(lastCookingAt) : null,
    );
  }
}
