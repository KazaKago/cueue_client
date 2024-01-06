import 'dart:async';

import 'package:cueue/cueue_app.dart';
import 'package:cueue/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAppCheck.instance.activate(webProvider: ReCaptchaV3Provider(const String.fromEnvironment('webRecaptchaSiteKey')));

  if (!kIsWeb) {
    FlutterError.onError = (details) async {
      FlutterError.presentError(details);
      await FirebaseCrashlytics.instance.recordFlutterFatalError(details);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  } else {
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }
  runApp(const ProviderScope(child: CueueApp()));
}
