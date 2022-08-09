import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_user_display_name_usecase.dart';

class UpdateUserDisplayNameUseCaseImpl implements UpdateUserDisplayNameUseCase {
  const UpdateUserDisplayNameUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call(String displayName) async {
    final user = await _userRepository.get();
    final userRegistration = UserRegistration(
      displayName: displayName,
      photoKey: user.photo?.key,
    );
    return _userRepository.update(userRegistration);
  }
}
