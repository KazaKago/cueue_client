import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_password_usecase.dart';

class UpdatePasswordUseCaseImpl implements UpdatePasswordUseCase {
  const UpdatePasswordUseCaseImpl(this._authorizeApiRepository, this._userRepository);

  final AuthorizeRepository _authorizeApiRepository;
  final UserRepository _userRepository;

  @override
  Future<void> call(final Password password) async {
    final user = await _userRepository.get();
    if (user.isPasswordLinked()) {
      await _userRepository.updatePassword(password);
    } else {
      final authInfo = PasswordAuthInfo(email: user.email, password: password);
      await _authorizeApiRepository.linkWithPassword(authInfo);
    }
  }
}
