import 'package:cueue/model/content/content.dart';
import 'package:cueue/model/recipe/recipe_id.dart';

abstract class RecipeSummary {
  RecipeSummary(this.id, this.title, this.image, this.lastCookingAt);

  final RecipeId id;
  final String title;
  final Content? image;
  final DateTime? lastCookingAt;
}
