import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_password_usecase.dart';

class UpdatePasswordUseCaseImpl implements UpdatePasswordUseCase {
  const UpdatePasswordUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call(final Password password) {
    return _userRepository.updatePassword(password);
  }
}
