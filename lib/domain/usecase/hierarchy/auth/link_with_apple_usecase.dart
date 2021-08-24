import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';

abstract class LinkWithAppleUseCase {
  Future<void> call(final AppleAuthInfo authInfo);
}
