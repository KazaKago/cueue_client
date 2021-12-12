import 'package:cueue/presentation/view/hierarchy/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CueueApp extends StatelessWidget {
  const CueueApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final lightThemeColor = Colors.lightGreen.shade500;
    final lightThemeVariantColor = Colors.lightGreen.shade700;
    final darkThemeColor = Colors.lightGreen.shade700;
    final darkThemeVariantColor = Colors.lightGreen.shade900;
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = lightThemeColor
      ..textColor = Colors.white
      ..backgroundColor = Colors.transparent;
    return MaterialApp(
      title: 'Cueue',
      theme: _buildTheme(ColorScheme.light(primary: lightThemeColor, primaryVariant: lightThemeVariantColor, secondary: lightThemeColor, secondaryVariant: lightThemeVariantColor)),
      darkTheme: _buildTheme(ColorScheme.dark(primary: darkThemeColor, primaryVariant: darkThemeVariantColor, secondary: darkThemeColor, secondaryVariant: darkThemeVariantColor)),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
      ],
      home: const SplashPage(),
      builder: EasyLoading.init(),
    );
  }

  ThemeData _buildTheme(final ColorScheme colorScheme) {
    final isDark = colorScheme.brightness == Brightness.dark;
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      primaryColorBrightness: isDark ? Brightness.dark : Brightness.light /* Need for AppBar title & icon color. */,
      toggleableActiveColor: colorScheme.primary /* Need for Checkbox color on dark theme, Maybe bug of Flutter. */,
      appBarTheme: AppBarTheme(
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark ? Colors.grey.shade800 : Colors.grey.shade50,
      ),
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2,
            color: colorScheme.primary /* Need for TabBar selected color, Maybe bug of Flutter. */,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          padding: const EdgeInsets.all(12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(12),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
    );
  }
}
