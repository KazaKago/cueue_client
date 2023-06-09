import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

class AppInfoConstants {
  factory AppInfoConstants() {
    final String storeLink;
    if (kIsWeb) {
      storeLink = const String.fromEnvironment('lpBaseUrl');
    } else if (Platform.isAndroid) {
      storeLink = const String.fromEnvironment('playStoreUrl');
    } else if (Platform.isIOS) {
      storeLink = const String.fromEnvironment('appleStoreUrl');
    } else {
      storeLink = const String.fromEnvironment('lpBaseUrl');
    }
    return AppInfoConstants._(storeLink);
  }

  AppInfoConstants._(this.storeLink);

  final webSite = const String.fromEnvironment('lpBaseUrl');
  final email = 'kazakago@gmail.com';
  final developer = 'KazaKago';
  final String storeLink;
}
