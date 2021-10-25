import 'package:cueue/data/api/di/api_provider.dart';
import 'package:cueue/data/api/global/requester/authorized_api_requester.dart';
import 'package:cueue/data/auth/di/auth_provider.dart';
import 'package:cueue/data/cache/di/cache_provider.dart';
import 'package:cueue/data/mapper/di/mapper_provider.dart';
import 'package:cueue/data/repository/global/requester/authorized_api_requester_impl.dart';
import 'package:cueue/data/repository/hierarchy/auth/authorize_repository_impl.dart';
import 'package:cueue/data/repository/hierarchy/content/content_repository_impl.dart';
import 'package:cueue/data/repository/hierarchy/info/info_repository_impl.dart';
import 'package:cueue/data/repository/hierarchy/menu/menu_repository_impl.dart';
import 'package:cueue/data/repository/hierarchy/recipe/recipe_repository_impl.dart';
import 'package:cueue/data/repository/hierarchy/store/store_repository_impl.dart';
import 'package:cueue/data/repository/hierarchy/tag/tag_repository_impl.dart';
import 'package:cueue/data/repository/hierarchy/user/user_repository_impl.dart';
import 'package:cueue/data/resource/di/resource_provider.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/content/content_repository.dart';
import 'package:cueue/domain/repository/hierarchy/info/info_repository.dart';
import 'package:cueue/domain/repository/hierarchy/menu/menu_repository.dart';
import 'package:cueue/domain/repository/hierarchy/recipe/recipe_repository.dart';
import 'package:cueue/domain/repository/hierarchy/store/store_repository.dart';
import 'package:cueue/domain/repository/hierarchy/tag/tag_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authorizedApiRequesterProvider = Provider<AuthorizedApiRequester>((_) => AuthorizedApiRequesterImpl());
final authorizeRepositoryProvider = Provider<AuthorizeRepository>((ref) => AuthorizeRepositoryImpl(ref.read(userCacheProvider), ref.read(userStateManagerProvider), ref.read(getUserApiProvider), ref.read(userResponseMapperProvider), ref.read(passwordSignaturerProvider), ref.read(googleSignaturerProvider), ref.read(appleSignaturerProvider), ref.read(allCacheProvider)));
final contentRepositoryProvider = Provider<ContentRepository>((ref) => ContentRepositoryImpl(ref.read(createContentApiProvider), ref.read(contentRequestMapperProvider), ref.read(contentResponseMapperProvider)));
final userRepositoryProvider = Provider<UserRepository>((ref) => UserRepositoryImpl(ref.read(userCacheProvider), ref.read(userStateManagerProvider), ref.read(getUserApiProvider), ref.read(createUserApiProvider), ref.read(userResponseMapperProvider), ref.read(passwordSignaturerProvider)));
final tagRepositoryProvider = Provider<TagRepository>((ref) => TagRepositoryImpl(ref.read(userCacheProvider), ref.read(userStateManagerProvider), ref.read(tagCacheProvider), ref.read(tagStateManagerProvider), ref.read(recipeCacheProvider), ref.read(recipeStateManagerProvider), ref.read(getUserApiProvider), ref.read(getTagsApiProvider), ref.read(createTagApiProvider), ref.read(updateTagApiProvider), ref.read(deleteTagApiProvider), ref.read(getRecipeApiProvider), ref.read(userResponseMapperProvider), ref.read(tagResponseMapperProvider), ref.read(tagRequestMapperProvider), ref.read(recipeResponseMapperProvider)));
final recipeRepositoryProvider = Provider<RecipeRepository>((ref) => RecipeRepositoryImpl(ref.read(userCacheProvider), ref.read(userStateManagerProvider), ref.read(recipeCacheProvider), ref.read(recipeStateManagerProvider), ref.read(allRecipesStateManagerProvider), ref.read(taggedRecipesStateManagerProvider), ref.read(menuCacheProvider), ref.read(menuStateManagerProvider), ref.read(menuSummaryStateManagerProvider), ref.read(getUserApiProvider), ref.read(getRecipesApiProvider), ref.read(getRecipeApiProvider), ref.read(createRecipeApiProvider), ref.read(updateRecipeApiProvider), ref.read(deleteRecipeApiProvider), ref.read(getMenuApiProvider), ref.read(getMenusApiProvider), ref.read(userResponseMapperProvider), ref.read(recipeResponseMapperProvider), ref.read(recipeSummaryResponseMapperProvider), ref.read(recipeRequestMapperProvider), ref.read(menuSummaryResponseMapperProvider), ref.read(menuResponseMapperProvider)));
final menuRepositoryProvider = Provider<MenuRepository>((ref) => MenuRepositoryImpl(ref.read(userCacheProvider), ref.read(userStateManagerProvider), ref.read(menuCacheProvider), ref.read(menuStateManagerProvider), ref.read(menuSummaryStateManagerProvider), ref.read(getUserApiProvider), ref.read(getMenuApiProvider), ref.read(getMenusApiProvider), ref.read(createMenuApiProvider), ref.read(updateMenuApiProvider), ref.read(deleteMenuApiProvider), ref.read(userResponseMapperProvider), ref.read(menuSummaryResponseMapperProvider), ref.read(menuResponseMapperProvider), ref.read(menuRequestMapperProvider)));
final storeRepositoryProvider = Provider<StoreRepository>((ref) => StoreRepositoryImpl(ref.read(storeInfoConstantsProvider)));
final infoRepositoryProvider = Provider<InfoRepository>((ref) => InfoRepositoryImpl(ref.read(developerInfoConstantsProvider)));
