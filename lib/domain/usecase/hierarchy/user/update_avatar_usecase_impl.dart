import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_avatar_usecase.dart';

class UpdateAvatarUseCaseImpl implements UpdateAvatarUseCase {
  const UpdateAvatarUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call(ContentRegistration contentRegistration) {
    return _userRepository.updatePhoto(contentRegistration);
  }
}
