import 'package:cueue/ui/hierarchy/main/main_page.dart';
import 'package:widgetbook/widgetbook.dart';

final mainComponent = WidgetbookComponent(
  name: 'Main',
  isExpanded: true,
  useCases: [
    WidgetbookUseCase(
      name: 'MainPage',
      builder: (_) => const MainPage(),
    ),
  ],
);
