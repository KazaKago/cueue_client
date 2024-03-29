// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: String.fromEnvironment('firebaseWebApiKey'),
    appId: String.fromEnvironment('firebaseWebAppId'),
    messagingSenderId: String.fromEnvironment('firebaseWebMessagingSenderId'),
    projectId: String.fromEnvironment('firebaseWebProjectId'),
    authDomain: String.fromEnvironment('firebaseWebAuthDomain'),
    storageBucket: String.fromEnvironment('firebaseWebStorageBucket'),
    measurementId: String.fromEnvironment('firebaseWebMeasurementId'),
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: String.fromEnvironment('firebaseAndroidApiKey'),
    appId: String.fromEnvironment('firebaseAndroidAppId'),
    messagingSenderId: String.fromEnvironment('firebaseAndroidMessagingSenderId'),
    projectId: String.fromEnvironment('firebaseAndroidProjectId'),
    storageBucket: String.fromEnvironment('firebaseAndroidStorageBucket'),
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: String.fromEnvironment('firebaseIosApiKey'),
    appId: String.fromEnvironment('firebaseIosAppId'),
    messagingSenderId: String.fromEnvironment('firebaseIosMessagingSenderId'),
    projectId: String.fromEnvironment('firebaseIosProjectId'),
    storageBucket: String.fromEnvironment('firebaseIosStorageBucket'),
    androidClientId: String.fromEnvironment('firebaseIosAndroidClientId'),
    iosClientId: String.fromEnvironment('firebaseIosIosClientId'),
    iosBundleId: String.fromEnvironment('firebaseIosIosBundleId'),
  );
}
