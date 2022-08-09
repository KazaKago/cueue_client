import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';
import 'package:cueue/domain/repository/hierarchy/content/content_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_user_photo_usecase.dart';

class UpdateUserPhotoUseCaseImpl implements UpdateUserPhotoUseCase {
  const UpdateUserPhotoUseCaseImpl(this._userRepository, this._contentRepository);

  final UserRepository _userRepository;
  final ContentRepository _contentRepository;

  @override
  Future<void> call(ContentRegistration? contentRegistration) async {
    final user = await _userRepository.get();
    final UserRegistration userRegistration;
    if (contentRegistration != null) {
      final content = await _contentRepository.create(contentRegistration);
      userRegistration = UserRegistration(displayName: user.displayName, photoKey: content.key);
    } else {
      userRegistration = UserRegistration(displayName: user.displayName, photoKey: null);
    }
    return _userRepository.update(userRegistration);
  }
}
