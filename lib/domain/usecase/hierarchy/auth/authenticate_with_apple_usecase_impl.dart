import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/authenticate_with_apple_usecase.dart';

class AuthenticateWithAppleUseCaseImpl implements AuthenticateWithAppleUseCase {
  const AuthenticateWithAppleUseCaseImpl(this._authorizeApiRepository, this._userRepository);

  final AuthorizeRepository _authorizeApiRepository;
  final UserRepository _userRepository;

  @override
  Future<void> call(final AppleAuthInfo authInfo) async {
    await _authorizeApiRepository.authenticateWithApple(authInfo);
    await _userRepository.create();
  }
}
