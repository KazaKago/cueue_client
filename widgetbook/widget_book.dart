import 'package:cueue/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgetbook/widgetbook.dart';

import 'ui/auth_component.dart';
import 'ui/invitation_component.dart';
import 'ui/main_component.dart';
import 'ui/menu_component.dart';
import 'ui/mypage_component.dart';
import 'ui/photo_component.dart';
import 'ui/recipe_component.dart';
import 'ui/search_component.dart';
import 'ui/setting_component.dart';
import 'ui/splash_component.dart';
import 'ui/tag_component.dart';

class WidgetBook extends StatelessWidget {
  const WidgetBook({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: (lightTheme, darkTheme) {
        return Widgetbook.material(
          appInfo: AppInfo(name: 'WidgetBook'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          devices: const [
            Apple.iPhone13Mini,
            Samsung.s21ultra,
            Desktop.desktop1080p,
          ],
          themes: [
            WidgetbookTheme(
              name: 'light',
              data: lightTheme,
            ),
            WidgetbookTheme(
              name: 'dark',
              data: darkTheme,
            ),
          ],
          categories: [
            WidgetbookCategory(
              name: 'Screen',
              widgets: [
                authComponent,
                invitationComponent,
                mainComponent,
                menuComponent,
                myPageComponent,
                photoComponent,
                recipeComponent,
                searchComponent,
                settingComponent,
                splashComponent,
                tagComponent,
              ],
            ),
          ],
        );
      },
    );
  }
}
