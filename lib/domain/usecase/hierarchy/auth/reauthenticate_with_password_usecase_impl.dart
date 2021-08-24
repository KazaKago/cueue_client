import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/reauthenticate_with_password_usecase.dart';

class ReauthenticateWithPasswordUseCaseImpl implements ReauthenticateWithPasswordUseCase {
  const ReauthenticateWithPasswordUseCaseImpl(this._authorizeRepository, this._userRepository);

  final AuthorizeRepository _authorizeRepository;
  final UserRepository _userRepository;

  @override
  Future<void> call(final Password password) async {
    final user = await _userRepository.get();
    await _authorizeRepository.reauthenticateWithPassword(PasswordAuthInfo(email: user.email, password: password));
  }
}
