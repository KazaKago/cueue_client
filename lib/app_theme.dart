import 'package:cueue/ui/global/utils/web_aware_page_transition_theme.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';

final _defaultLightBrandColor = Colors.lightGreen.shade500;
final _defaultDarkBrandColor = Colors.lightGreen.shade700;

class AppTheme extends StatelessWidget {
  const AppTheme({super.key, required this.child});

  final Widget Function(ThemeData lightTheme, ThemeData darkTheme) child;

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final lightColorScheme = _buildColorScheme(lightDynamic, _defaultLightBrandColor, Brightness.light);
        final darkColorScheme = _buildColorScheme(darkDynamic, _defaultDarkBrandColor, Brightness.dark);
        final lightTheme = _buildTheme(lightColorScheme);
        final darkTheme = _buildTheme(darkColorScheme);
        EasyLoading.instance
          ..maskType = EasyLoadingMaskType.black
          ..indicatorType = EasyLoadingIndicatorType.dualRing
          ..loadingStyle = EasyLoadingStyle.custom
          ..indicatorColor = darkTheme.colorScheme.primary
          ..textColor = Colors.white
          ..backgroundColor = Colors.transparent;
        return child(lightTheme, darkTheme);
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

  ThemeData _buildTheme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: colorScheme.primary,
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
      visualDensity: VisualDensity.standard,
    );
  }
}
