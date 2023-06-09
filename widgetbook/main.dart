import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api/content/fake_create_content_api.dart';
import 'api/content/fake_get_bytes_from_uri_api.dart';
import 'api/fake_firebase_user.dart';
import 'api/invitation/fake_accept_invitation_api.dart';
import 'api/invitation/fake_create_invitation_api.dart';
import 'api/invitation/fake_get_invitation_api.dart';
import 'api/menu/fake_create_menu_api.dart';
import 'api/menu/fake_delete_menu_api.dart';
import 'api/menu/fake_get_menu_api.dart';
import 'api/menu/fake_get_menus_api.dart';
import 'api/menu/fake_update_menu_api.dart';
import 'api/recipe/fake_create_recipe_api.dart';
import 'api/recipe/fake_delete_recipe_api.dart';
import 'api/recipe/fake_get_recipe_api.dart';
import 'api/recipe/fake_get_recipes_api.dart';
import 'api/recipe/fake_update_recipe_api.dart';
import 'api/tag/fake_create_tag_api.dart';
import 'api/tag/fake_delete_tag_api.dart';
import 'api/tag/fake_get_tags_api.dart';
import 'api/tag/fake_order_tag_api.dart';
import 'api/tag/fake_update_tag_api.dart';
import 'api/user/fake_create_user_api.dart';
import 'api/user/fake_get_user_api.dart';
import 'api/user/fake_update_user_api.dart';
import 'api/workspace/fake_create_workspace_api.dart';
import 'api/workspace/fake_update_workspace_api.dart';
import 'widget_book.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        getUserApiProvider.overrideWithValue(const FakeGetUserApi()),
        createUserApiProvider.overrideWithValue(const FakeCreateUserApi()),
        updateUserApiProvider.overrideWithValue(const FakeUpdateUserApi()),
        createInvitationApiProvider.overrideWithValue(const FakeCreateInvitationApi()),
        getInvitationApiProvider.overrideWithValue(const FakeGetInvitationApi()),
        acceptInvitationApiProvider.overrideWithValue(const FakeAcceptInvitationApi()),
        getTagsApiProvider.overrideWithValue(const FakeGetTagsApi()),
        createTagApiProvider.overrideWithValue(const FakeCreateTagApi()),
        updateTagApiProvider.overrideWithValue(const FakeUpdateTagApi()),
        deleteTagApiProvider.overrideWithValue(const FakeDeleteTagApi()),
        orderTagApiProvider.overrideWithValue(const FakeOrderTagApi()),
        createWorkspaceApiProvider.overrideWithValue(const FakeCreateWorkspaceApi()),
        updateWorkspaceApiProvider.overrideWithValue(const FakeUpdateWorkspaceApi()),
        createContentApiProvider.overrideWithValue(const FakeCreateContentApi()),
        getBytesFromUriApiProvider.overrideWithValue(const FakeGetBytesFromUriApi()),
        getRecipesApiProvider.overrideWithValue(const FakeGetRecipesApi()),
        getRecipeApiProvider.overrideWithValue(const FakeGetRecipeApi()),
        createRecipeApiProvider.overrideWithValue(const FakeCreateRecipeApi()),
        updateRecipeApiProvider.overrideWithValue(const FakeUpdateRecipeApi()),
        deleteRecipeApiProvider.overrideWithValue(const FakeDeleteRecipeApi()),
        getMenusApiProvider.overrideWithValue(const FakeGetMenusApi()),
        getMenuApiProvider.overrideWithValue(const FakeGetMenuApi()),
        createMenuApiProvider.overrideWithValue(const FakeCreateMenuApi()),
        updateMenuApiProvider.overrideWithValue(const FakeUpdateMenuApi()),
        deleteMenuApiProvider.overrideWithValue(const FakeDeleteMenuApi()),
        streamFirebaseUserProvider.overrideWith((ref) => Stream.value(const FakeFirebaseUser())),
        getFirebaseUserProvider.overrideWithValue(const FakeFirebaseUser()),
      ],
      child: const WidgetBook(),
    ),
  );
}
