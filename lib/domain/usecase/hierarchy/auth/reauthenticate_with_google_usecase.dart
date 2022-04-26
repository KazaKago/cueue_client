import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';

abstract class ReauthenticateWithGoogleUseCase {
  Future<void> call(GoogleAuthInfo authInfo);
}
