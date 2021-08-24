import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_google_usecase.dart';

class ReauthenticateWithGoogleUseCaseImpl implements ReauthenticateWithGoogleUseCase {
  const ReauthenticateWithGoogleUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call(final GoogleAuthInfo authInfo) async {
    await _authorizeApiRepository.reauthenticateWithGoogle(authInfo);
  }
}
