import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/model/hierarchy/user/pre_user.dart';
import 'package:cueue/domain/repository/hierarchy/content/content_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/get_pre_user_info_usecase.dart';

class GetPreUserInfoUseCaseImpl implements GetPreUserInfoUseCase {
  const GetPreUserInfoUseCaseImpl(this._userRepository, this._contentRepository);

  final UserRepository _userRepository;
  final ContentRepository _contentRepository;

  @override
  Future<PreUser> call() async {
    final authUser = await _userRepository.getPreUserInfo();
    final displayName = authUser.displayName ?? authUser.email ?? '';
    final photoUrl = authUser.photoURL;
    final content = (photoUrl != null) ? await _contentRepository.create(ContentRegistration.uri(uri: Uri.parse(photoUrl))) : null;
    return PreUser(displayName: displayName, photo: content);
  }
}
