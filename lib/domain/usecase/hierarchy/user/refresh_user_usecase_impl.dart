import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/refresh_user_usecase.dart';

class RefreshUserUseCaseImpl implements RefreshUserUseCase {
  const RefreshUserUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call() {
    return _userRepository.refresh();
  }
}
