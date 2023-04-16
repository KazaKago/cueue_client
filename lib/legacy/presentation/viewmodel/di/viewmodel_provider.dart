import 'package:cueue/legacy/domain/usecase/di/usecase_provider.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/menu/menu_detail_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/menu/menu_editing_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/menu/menu_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_detail_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_editing_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_selection_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/search/search_viewmodel.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/tag/tag_viewmodel.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_search_option.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeViewModelProvider = ChangeNotifierProvider.autoDispose.family<RecipeViewModel, RecipeSearchOption?>((ref, searchOption) => RecipeViewModel(ref.read(followAllRecipesUseCaseProvider), ref.read(refreshAllRecipesUseCaseProvider), ref.read(requestAdditionalAllRecipesUseCaseProvider), searchOption ?? RecipeSearchOption()));
final recipeSelectionViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => RecipeSelectionViewModel(ref.read(followTagsUseCaseProvider), ref.read(refreshTagsUseCaseProvider)));
final tagViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => TagViewModel(ref.read(followTagsUseCaseProvider), ref.read(refreshTagsUseCaseProvider), ref.read(reorderTagUseCaseProvider)));
final menuViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => MenuViewModel(ref.read(followAllMenusUseCaseProvider), ref.read(refreshAllMenusUseCaseProvider), ref.read(requestAdditionalAllMenusUseCaseProvider)));
final searchViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => SearchViewModel(ref.read(followTagsUseCaseProvider), ref.read(refreshTagsUseCaseProvider)));
final recipeEditingViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => RecipeEditingViewModel(ref.read(followTagsUseCaseProvider), ref.read(refreshTagsUseCaseProvider), ref.read(createRecipeUseCaseProvider), ref.read(updateRecipeUseCaseProvider), ref.read(deleteRecipeUseCaseProvider), ref.read(createContentUseCaseProvider)));
final menuEditingViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => MenuEditingViewModel(ref.read(createMenuUseCaseProvider), ref.read(updateMenuUseCaseProvider), ref.read(deleteMenuUseCaseProvider)));
final recipeDetailViewModelProvider = ChangeNotifierProvider.autoDispose.family<RecipeDetailViewModel, RecipeId>((ref, recipeId) => RecipeDetailViewModel(ref.read(followRecipeUseCaseProvider), ref.read(refreshRecipeUseCaseProvider), recipeId));
final menuDetailViewModelProvider = ChangeNotifierProvider.autoDispose.family<MenuDetailViewModel, MenuId>((ref, menuId) => MenuDetailViewModel(ref.read(followMenuUseCaseProvider), ref.read(refreshMenuUseCaseProvider), menuId));