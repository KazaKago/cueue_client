import 'package:cueue/ui/hierarchy/mypage/my_page.dart';
import 'package:widgetbook/widgetbook.dart';

final myPageComponent = WidgetbookComponent(
  name: 'MyPage',
  useCases: [
    WidgetbookUseCase(
      name: 'MyPage',
      builder: (_) => const MyPage(),
    ),
  ],
);
