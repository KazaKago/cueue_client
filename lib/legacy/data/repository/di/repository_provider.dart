import 'package:cueue/legacy/data/cache/di/cache_provider.dart';
import 'package:cueue/legacy/data/repository/flowable/menu/menu_summary_flowable_factory.dart';
import 'package:cueue/legacy/data/repository/flowable/recipe/recipes_flowable_factory.dart';
import 'package:cueue/legacy/data/repository/flowable/tag/tag_flowable_factory.dart';
import 'package:cueue/legacy/data/repository/hierarchy/auth/authorize_repository_impl.dart';
import 'package:cueue/legacy/data/repository/hierarchy/menu/menu_repository_impl.dart';
import 'package:cueue/legacy/data/repository/hierarchy/recipe/recipe_repository_impl.dart';
import 'package:cueue/legacy/data/repository/hierarchy/tag/tag_repository_impl.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/legacy/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/mapper_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authorizeRepositoryProvider = Provider<AuthorizeRepository>((ref) => AuthorizeRepositoryImpl(ref.read(allCacheProvider)));
final tagRepositoryProvider = Provider<TagRepository>((ref) => TagRepositoryImpl(ref.read(orderTagApiProvider), ref.read(tagOrderRequestMapperProvider), ref.read(tagFlowableFactoryProvider)));
final recipeRepositoryProvider = Provider<RecipeRepository>((ref) => RecipeRepositoryImpl(ref.read(recipesFlowableFactoryProvider)));
final menuRepositoryProvider = Provider<MenuRepository>((ref) => MenuRepositoryImpl(ref.read(menuSummaryFlowableFactoryProvider)));
final menuSummaryFlowableFactoryProvider = Provider<MenuSummaryFlowableFactory>((ref) => MenuSummaryFlowableFactory(ref.read(menuCacheProvider), ref.read(menuSummaryStateManagerProvider), ref.read(getMenusApiProvider), ref.read(menuSummaryResponseMapperProvider)));
final recipesFlowableFactoryProvider = Provider<RecipesFlowableFactory>((ref) => RecipesFlowableFactory(ref.read(recipeCacheProvider), ref.read(recipesStateManagerProvider), ref.read(getRecipesApiProvider), ref.read(recipeSummaryResponseMapperProvider)));
final tagFlowableFactoryProvider = Provider<TagFlowableFactory>((ref) => TagFlowableFactory(ref.read(tagCacheProvider), ref.read(tagStateManagerProvider), ref.read(getTagsApiProvider), ref.read(tagResponseMapperProvider)));
