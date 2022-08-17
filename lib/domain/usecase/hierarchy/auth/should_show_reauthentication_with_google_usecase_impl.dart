import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/should_show_reauthentication_with_google_usecase.dart';

class ShouldShowReauthenticationWithGoogleUseCaseImpl implements ShouldShowReauthenticationWithGoogleUseCase {
  const ShouldShowReauthenticationWithGoogleUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<bool> call() async {
    try {
      final user = await _userRepository.get();
      return user.isGoogleLinked();
    } on Exception catch (_) {
      return false;
    }
  }
}
