import 'package:cueue/legacy/domain/usecase/di/usecase_provider.dart';
import 'package:cueue/legacy/presentation/viewmodel/hierarchy/recipe/recipe_selection_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final recipeSelectionViewModelProvider = ChangeNotifierProvider.autoDispose((ref) => RecipeSelectionViewModel(ref.read(followTagsUseCaseProvider), ref.read(refreshTagsUseCaseProvider)));
