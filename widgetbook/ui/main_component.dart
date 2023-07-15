import 'package:cueue/ui/hierarchy/main/main_page.dart';
import 'package:cueue/ui/hierarchy/menu/menu_page.dart';
import 'package:widgetbook/widgetbook.dart';

final mainComponent = WidgetbookComponent(
  name: 'Main',
  useCases: [
    WidgetbookUseCase(
      name: 'MainPage',
      builder: (_) {
        return MainPage(
          goBranch: (_) {},
          currentIndex: 0,
          child: const MenuPage(),
        );
      },
    ),
  ],
);
