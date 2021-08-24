import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';

abstract class AuthenticateWithGoogleUseCase {
  Future<void> call(final GoogleAuthInfo authInfo);
}
