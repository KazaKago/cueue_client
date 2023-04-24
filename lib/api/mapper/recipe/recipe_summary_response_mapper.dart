import 'package:cueue/api/mapper/content/content_response_mapper.dart';
import 'package:cueue/api/response/recipe/recipe_summary_response.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/recipe/recipe_summary_impl.dart';

class RecipeSummaryResponseMapper {
  const RecipeSummaryResponseMapper(this._contentResponseMapper);

  final ContentResponseMapper _contentResponseMapper;

  RecipeSummary call(RecipeSummaryResponse response) {
    final image = response.image;
    final lastCookingAt = response.lastCookingAt;
    return RecipeSummaryImpl(
      id: RecipeId(response.id),
      title: response.title,
      image: (image != null) ? _contentResponseMapper(image) : null,
      lastCookingAt: (lastCookingAt != null) ? DateTime.parse(lastCookingAt) : null,
    );
  }
}
