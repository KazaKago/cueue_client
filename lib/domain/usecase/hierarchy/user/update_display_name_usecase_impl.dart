import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_display_name_usecase.dart';

class UpdateDisplayNameUseCaseImpl implements UpdateDisplayNameUseCase {
  const UpdateDisplayNameUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call(String displayName) {
    return _userRepository.updateDisplayName(displayName);
  }
}
