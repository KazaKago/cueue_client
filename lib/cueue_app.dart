import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/utils/route_observer.dart';
import 'package:cueue/presentation/view/global/utils/web_aware_page_transition_theme.dart';
import 'package:cueue/presentation/view/hierarchy/splash/splash_page.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CueueApp extends HookConsumerWidget {
  const CueueApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightBrandColor = Colors.lightGreen.shade500;
    final darkBrandColor = Colors.lightGreen.shade700;
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final lightColorScheme = _buildColorScheme(lightDynamic, lightBrandColor, Brightness.light);
        final darkColorScheme = _buildColorScheme(darkDynamic, darkBrandColor, Brightness.dark);
        EasyLoading.instance
          ..maskType = EasyLoadingMaskType.black
          ..indicatorType = EasyLoadingIndicatorType.dualRing
          ..loadingStyle = EasyLoadingStyle.custom
          ..indicatorColor = darkColorScheme.primary
          ..textColor = Colors.white
          ..backgroundColor = Colors.transparent;
        return MaterialApp(
          onGenerateTitle: (context) => intl(context).appName,
          theme: _buildTheme(context, lightColorScheme),
          darkTheme: _buildTheme(context, darkColorScheme),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          navigatorObservers: [routeObserver],
          supportedLocales: const [
            Locale('ja', 'JP'),
          ],
          home: const SplashPage(),
          builder: EasyLoading.init(),
        );
      },
    );
  }

  ColorScheme _buildColorScheme(ColorScheme? dynamicColor, Color fallbackColor, Brightness brightness) {
    if (dynamicColor != null) {
      return dynamicColor.harmonized();
    } else {
      return ColorScheme.fromSeed(seedColor: fallbackColor, brightness: brightness);
    }
  }

  ThemeData _buildTheme(BuildContext context, ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      toggleableActiveColor: colorScheme.primary /* Need for Checkbox color on dark theme, Bug of Flutter. https://github.com/flutter/flutter/issues/104446 */,
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.onSurface /* Need for TabBar label color, Maybe bug of Flutter */,
        indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 2, color: colorScheme.primary)) /* Need for TabBar indicator color, Maybe bug of Flutter. */,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: colorScheme.primary,
          onPrimary: Colors.white,
          padding: const EdgeInsets.all(12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colorScheme.primary),
          padding: const EdgeInsets.all(12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(12),
        ),
      ),
      pageTransitionsTheme: WebAwareTransitionTheme(),
      textTheme: GoogleFonts.mPlus1pTextTheme(
        ThemeData(brightness: colorScheme.brightness).textTheme,
      ),
    );
  }
}
