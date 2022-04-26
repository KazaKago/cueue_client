import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/authenticate_with_google_usecase.dart';

class AuthenticateWithGoogleUseCaseImpl implements AuthenticateWithGoogleUseCase {
  const AuthenticateWithGoogleUseCaseImpl(this._authorizeApiRepository, this._userRepository);

  final AuthorizeRepository _authorizeApiRepository;
  final UserRepository _userRepository;

  @override
  Future<void> call(GoogleAuthInfo authInfo) async {
    await _authorizeApiRepository.authenticateWithGoogle(authInfo);
    await _userRepository.create();
  }
}
