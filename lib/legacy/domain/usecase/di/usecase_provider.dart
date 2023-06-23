import 'package:cueue/legacy/data/repository/di/repository_provider.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/follow_all_recipes_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/follow_all_recipes_usecase_impl.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/refresh_all_recipes_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/refresh_all_recipes_usecase_impl.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/request_additional_all_recipes_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/recipe/request_additional_all_recipes_usecase_impl.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/follow_tags_usecase_impl.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/refresh_tags_usecase.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/tag/refresh_tags_usecase_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final followTagsUseCaseProvider = Provider<FollowTagsUseCase>((ref) => FollowTagsUseCaseImpl(ref.read(tagRepositoryProvider)));
final refreshTagsUseCaseProvider = Provider<RefreshTagsUseCase>((ref) => RefreshTagsUseCaseImpl(ref.read(tagRepositoryProvider)));
final followAllRecipesUseCaseProvider = Provider<FollowAllRecipesUseCase>((ref) => FollowAllRecipesUseCaseImpl(ref.read(recipeRepositoryProvider)));
final refreshAllRecipesUseCaseProvider = Provider<RefreshAllRecipesUseCase>((ref) => RefreshAllRecipesUseCaseImpl(ref.read(recipeRepositoryProvider)));
final requestAdditionalAllRecipesUseCaseProvider = Provider<RequestAdditionalAllRecipesUseCase>((ref) => RequestAdditionalAllRecipesUseCaseImpl(ref.read(recipeRepositoryProvider)));
