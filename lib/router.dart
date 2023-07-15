import 'package:cueue/hooks/global/swr/swr_lifecycle_observer.dart';
import 'package:cueue/model/invitation/invitation_code.dart';
import 'package:cueue/model/menu/menu_id.dart';
import 'package:cueue/model/menu/menu_summary.dart';
import 'package:cueue/model/recipe/recipe.dart';
import 'package:cueue/model/recipe/recipe_id.dart';
import 'package:cueue/model/recipe/recipe_summary.dart';
import 'package:cueue/model/tag/tag.dart';
import 'package:cueue/model/tag/tag_id.dart';
import 'package:cueue/ui/hierarchy/auth/authentication_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_creation_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_info_page.dart';
import 'package:cueue/ui/hierarchy/invitation/invitation_input_page.dart';
import 'package:cueue/ui/hierarchy/main/main_page.dart';
import 'package:cueue/ui/hierarchy/menu/menu_detail_page.dart';
import 'package:cueue/ui/hierarchy/menu/menu_editing_page.dart';
import 'package:cueue/ui/hierarchy/menu/menu_page.dart';
import 'package:cueue/ui/hierarchy/mypage/my_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_detail_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_editing_page.dart';
import 'package:cueue/ui/hierarchy/recipe/recipe_page.dart';
import 'package:cueue/ui/hierarchy/search/search_page.dart';
import 'package:cueue/ui/hierarchy/setting/about_page.dart';
import 'package:cueue/ui/hierarchy/setting/account_deletion_page.dart';
import 'package:cueue/ui/hierarchy/setting/settings_page.dart';
import 'package:cueue/ui/hierarchy/setting/thanks_for_using_page.dart';
import 'package:cueue/ui/hierarchy/tag/tag_editing_page.dart';
import 'package:cueue/ui/hierarchy/tag/tag_page.dart';
import 'package:cueue/ui/hierarchy/welcome/user_creation_page.dart';
import 'package:cueue/ui/hierarchy/welcome/workspace_creation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

String? _loginRedirect(BuildContext context, GoRouterState state) {
  if (FirebaseAuth.instance.currentUser != null) {
    return null;
  } else {
    return '/authentication';
  }
}

final GoRouter router = GoRouter(
  observers: [swrLifecycleObserver],
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'root',
      redirect: (context, state) {
        if (FirebaseAuth.instance.currentUser != null) {
          return '/menus';
        } else {
          return '/authentication';
        }
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPage(
          currentIndex: navigationShell.currentIndex,
          goBranch: navigationShell.goBranch,
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/menus',
              name: 'menus',
              redirect: _loginRedirect,
              builder: (BuildContext context, GoRouterState state) {
                return const MenuPage();
              },
              routes: [
                GoRoute(
                  path: 'new',
                  name: 'menu_new',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return MenuEditingPage();
                  },
                ),
                GoRoute(
                  path: ':menu_id',
                  name: 'menu_detail',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return MenuDetailPage(
                      menuId: MenuId(int.parse(state.pathParameters['menu_id']!)),
                      menuSummary: state.extra as MenuSummary?,
                    );
                  },
                  //   routes: [
                  //     GoRoute(
                  //       path: 'editing',
                  //       name: 'menu_editing',
                  //       parentNavigatorKey: _rootNavigatorKey,
                  //       builder: (BuildContext context, GoRouterState state) {
                  //         return MenuEditingPage(MenuSummary(int.parse(state.pathParameters['menu_id']!)));
                  //       },
                  //     ),
                  //   ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/recipes',
              name: 'recipes',
              redirect: _loginRedirect,
              builder: (BuildContext context, GoRouterState state) {
                return const RecipePage();
              },
              routes: [
                GoRoute(
                  path: 'new',
                  name: 'recipe_new',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const RecipeEditingPage();
                  },
                ),
                GoRoute(
                  path: ':recipe_id',
                  name: 'recipe_detail',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return RecipeDetailPage(
                      recipeId: RecipeId(int.parse(state.pathParameters['recipe_id']!)),
                      recipeSummary: state.extra as RecipeSummary?,
                    );
                  },
                  routes: [
                    GoRoute(
                      path: 'editing',
                      name: 'recipe_editing',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return RecipeEditingPage(
                          recipeId: RecipeId(int.parse(state.pathParameters['recipe_id']!)),
                          recipe: state.extra as Recipe?,
                        );
                      },
                    ),
                  ],
                ),
                GoRoute(
                  path: 'tags',
                  name: 'tags',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const TagPage();
                  },
                  routes: [
                    GoRoute(
                      path: 'new',
                      name: 'tag_new',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return const TagEditingPage();
                      },
                    ),
                    GoRoute(
                      path: ':tag_id/editing',
                      name: 'tag_editing',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return TagEditingPage(
                          tagId: TagId(int.parse(state.pathParameters['tag_id']!)),
                          tag: state.extra as Tag?,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/search',
              name: 'search',
              redirect: _loginRedirect,
              builder: (BuildContext context, GoRouterState state) {
                return const SearchPage();
              },
              // routes: [
              //   GoRoute(
              //     path: 'result',
              //     name: 'search_result',
              //     parentNavigatorKey: _rootNavigatorKey,
              //     builder: (BuildContext context, GoRouterState state) {
              //       return const SearchResultPage(keyword, tagIds);
              //     },
              //   ),
              // ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/my_page',
              name: 'my_page',
              redirect: _loginRedirect,
              builder: (BuildContext context, GoRouterState state) {
                return const MyPage();
              },
              routes: [
                GoRoute(
                  path: 'invitation_creation',
                  name: 'invitation_creation',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const InvitationCreationPage();
                  },
                ),
                GoRoute(
                  path: 'settings',
                  name: 'settings',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return const SettingsPage();
                  },
                  routes: [
                    GoRoute(
                      path: 'invitation_input',
                      name: 'invitation_input',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return const InvitationInputPage();
                      },
                      routes: [
                        GoRoute(
                          path: ':code',
                          name: 'invitation_info',
                          parentNavigatorKey: _rootNavigatorKey,
                          builder: (BuildContext context, GoRouterState state) {
                            return InvitationInfoPage(InvitationCode(state.pathParameters['code']!));
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'about',
                      name: 'about',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return const AboutPage();
                      },
                    ),
                    GoRoute(
                      path: 'account_deletion',
                      name: 'account_deletion',
                      parentNavigatorKey: _rootNavigatorKey,
                      builder: (BuildContext context, GoRouterState state) {
                        return const AccountDeletionPage();
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/user_creation',
      name: 'user_creation',
      redirect: _loginRedirect,
      builder: (BuildContext context, GoRouterState state) {
        return const UserCreationPage();
      },
    ),
    GoRoute(
      path: '/workspace_creation',
      name: 'workspace_creation',
      redirect: _loginRedirect,
      builder: (BuildContext context, GoRouterState state) {
        return const WorkspaceCreationPage();
      },
      routes: [
        GoRoute(
          path: ':code',
          name: 'invitation_info_for_use_start_workspace',
          redirect: _loginRedirect,
          builder: (BuildContext context, GoRouterState state) {
            return InvitationInfoPage(InvitationCode(state.pathParameters['code']!));
          },
        ),
      ],
    ),
    GoRoute(
      path: '/thanks_for_using',
      name: 'thanks_for_using',
      redirect: _loginRedirect,
      builder: (BuildContext context, GoRouterState state) {
        return const ThanksForUsingPage();
      },
    ),
    GoRoute(
      path: '/authentication',
      name: 'authentication',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthenticationPage();
      },
      routes: [
        GoRoute(
          path: 'about',
          name: 'about_for_authentication_page',
          builder: (BuildContext context, GoRouterState state) {
            return const AboutPage();
          },
        ),
      ],
    ),
  ],
);
