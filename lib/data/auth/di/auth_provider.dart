import 'package:cueue/data/auth/hierarchy/apple/apple_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/google/google_signaturer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleSignaturerProvider = Provider((ref) => const GoogleSignaturer());
final appleSignaturerProvider = Provider((ref) => const AppleSignaturer());
