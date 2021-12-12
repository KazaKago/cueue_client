import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_password_usecase.dart';

class ShouldShowReauthenticationWithPasswordUseCaseImpl implements ShouldShowReauthenticationWithPasswordUseCase {
  const ShouldShowReauthenticationWithPasswordUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<bool> call() async {
    final user = await _userRepository.getOrNull();
    if (user == null) return false;
    return user.isPasswordLinked();
  }
}
