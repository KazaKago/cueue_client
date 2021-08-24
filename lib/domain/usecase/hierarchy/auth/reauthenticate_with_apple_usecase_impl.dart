import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_apple_usecase.dart';

class ReauthenticateWithAppleUseCaseImpl implements ReauthenticateWithAppleUseCase {
  const ReauthenticateWithAppleUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call(final AppleAuthInfo authInfo) async {
    await _authorizeApiRepository.reauthenticateWithApple(authInfo);
  }
}
