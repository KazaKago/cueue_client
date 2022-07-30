import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_apple_usecase.dart';

class ReauthenticateWithAppleUseCaseImpl implements ReauthenticateWithAppleUseCase {
  const ReauthenticateWithAppleUseCaseImpl(this._authorizeApiRepository, this._userRepository);

  final AuthorizeRepository _authorizeApiRepository;
  final UserRepository _userRepository;

  @override
  Future<void> call(AppleAuthInfo authInfo, RequireReauthenticationException exception) async {
    await _authorizeApiRepository.reauthenticateWithApple(authInfo);
    await exception.type.when(
      deleteAccount: () async {
        await _userRepository.delete();
      },
    );
  }
}
