import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_apple_usecase.dart';

class ShouldShowReauthenticationWithAppleUseCaseImpl implements ShouldShowReauthenticationWithAppleUseCase {
  const ShouldShowReauthenticationWithAppleUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<bool> call() async {
    try {
      final user = await _userRepository.get();
      return user.isAppleLinked();
    } on Exception catch (_) {
      return false;
    }
  }
}
