import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';

abstract class LinkWithGoogleUseCase {
  Future<void> call(final GoogleAuthInfo authInfo);
}
