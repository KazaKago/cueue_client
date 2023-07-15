import 'package:cueue/app_theme.dart';
import 'package:cueue/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CueueApp extends StatelessWidget {
  const CueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: (lightTheme, darkTheme) {
        return MaterialApp.router(
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
          theme: lightTheme,
          darkTheme: darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // navigatorObservers: [
          //   routeObserver,
          //   swrLifecycleObserver,
          // ],
          routerConfig: router,
          // home: const SplashPage(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
