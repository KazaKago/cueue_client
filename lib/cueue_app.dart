import 'package:cueue/l10n/intl.dart';
import 'package:cueue/presentation/view/global/utils/route_observer.dart';
import 'package:cueue/presentation/view/hierarchy/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class CueueApp extends StatelessWidget {
  const CueueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightThemeColor = Colors.lightGreen.shade500;
    final darkThemeColor = Colors.lightGreen.shade700;
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.black
      ..indicatorType = EasyLoadingIndicatorType.dualRing
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorColor = lightThemeColor
      ..textColor = Colors.white
      ..backgroundColor = Colors.transparent;
    return MaterialApp(
      onGenerateTitle: (context) => intl(context).appName,
      theme: _buildTheme(context, ColorScheme.light(primary: lightThemeColor, secondary: lightThemeColor)),
      darkTheme: _buildTheme(context, ColorScheme.dark(primary: darkThemeColor, secondary: darkThemeColor)),
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
  }

  ThemeData _buildTheme(BuildContext context, ColorScheme colorScheme) {
    final isDark = colorScheme.brightness == Brightness.dark;
    return ThemeData(
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
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
      textTheme: GoogleFonts.mPlus1pTextTheme(
        ThemeData(brightness: colorScheme.brightness).textTheme,
      ),
    );
  }
}
