import 'package:cueue/ui/hierarchy/splash/splash_page.dart';
import 'package:widgetbook/widgetbook.dart';

final splashComponent = WidgetbookComponent(
  name: 'Splash',
  useCases: [
    WidgetbookUseCase(
      name: 'SplashPage',
      builder: (_) => const SplashPage(),
    ),
  ],
);
