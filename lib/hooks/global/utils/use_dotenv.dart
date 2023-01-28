import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

String useDotEnv(String key) {
  return useMemoized(() => dotenv.get(key), [key]);
}
