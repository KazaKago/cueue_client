import 'dart:async';

import 'package:cueue/cueue_app.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    dotenv.load(fileName: '.env.${const String.fromEnvironment('FLAVOR')}'),
    Firebase.initializeApp(),
  ]);
  await FirebaseAppCheck.instance.activate();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  await runZonedGuarded<Future<void>>(() async {
    runApp(const ProviderScope(child: CueueApp()));
  }, FirebaseCrashlytics.instance.recordError);
}
