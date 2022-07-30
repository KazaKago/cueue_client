import 'dart:async';

import 'package:cueue/cueue_app.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    dotenv.load(fileName: "assets/env/${const String.fromEnvironment('DOT_ENV', defaultValue: 'dotenv')}"),
    Firebase.initializeApp(),
  ]);
  await FirebaseAppCheck.instance.activate(webRecaptchaSiteKey: dotenv.get('WEB_RECAPTCHA_SITE_KEY'));

  if (!kIsWeb) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await runZonedGuarded<Future<void>>(
      () async {
        runApp(const ProviderScope(child: CueueApp()));
      },
      FirebaseCrashlytics.instance.recordError,
    );
  } else {
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    runApp(const ProviderScope(child: CueueApp()));
  }
}
