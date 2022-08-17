import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:universal_io/io.dart';

class AppInfoConstants {
  factory AppInfoConstants() {
    final String storeLink;
    if (kIsWeb) {
      storeLink = dotenv.get('LP_BASE_URL');
    } else if (Platform.isAndroid) {
      storeLink = dotenv.get('PLAY_STORE_URL');
    } else if (Platform.isIOS) {
      storeLink = dotenv.get('APP_STORE_URL');
    } else {
      storeLink = dotenv.get('LP_BASE_URL');
    }
    return AppInfoConstants._(storeLink);
  }

  AppInfoConstants._(this.storeLink);

  final webSite = dotenv.get('LP_BASE_URL');
  final email = 'kazakago@gmail.com';
  final developer = 'KazaKago';
  final String storeLink;
}
