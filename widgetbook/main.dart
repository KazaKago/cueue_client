import 'package:cueue/provider/api_provider.dart';
import 'package:cueue/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api/fake_content_api.dart';
import 'api/fake_firebase_user.dart';
import 'api/fake_invitation_api.dart';
import 'api/fake_menu_api.dart';
import 'api/fake_recipe_api.dart';
import 'api/fake_tags_api.dart';
import 'api/fake_user_api.dart';
import 'api/fake_workspace_api.dart';
import 'widget_book.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/env/${const String.fromEnvironment('DOT_ENV', defaultValue: 'dotenv')}");
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
