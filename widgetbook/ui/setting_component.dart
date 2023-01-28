import 'package:cueue/ui/hierarchy/setting/about_page.dart';
import 'package:cueue/ui/hierarchy/setting/account_deletion_page.dart';
import 'package:cueue/ui/hierarchy/setting/settings_page.dart';
import 'package:cueue/ui/hierarchy/setting/thanks_for_using_page.dart';
import 'package:widgetbook/widgetbook.dart';

final settingComponent = WidgetbookComponent(
  name: 'Setting',
  isExpanded: true,
  useCases: [
    WidgetbookUseCase(
      name: 'AboutPage',
      builder: (_) => const AboutPage(),
    ),
    WidgetbookUseCase(
      name: 'AccountDeletionPage',
      builder: (_) => const AccountDeletionPage(),
    ),
    WidgetbookUseCase(
      name: 'SettingsPage',
      builder: (_) => const SettingsPage(),
    ),
    WidgetbookUseCase(
      name: 'ThanksForUsingPage',
      builder: (_) => const ThanksForUsingPage(),
    ),
  ],
);
