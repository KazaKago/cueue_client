import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/link_with_google_usecase.dart';

class LinkWithGoogleUseCaseImpl implements LinkWithGoogleUseCase {
  const LinkWithGoogleUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call(final GoogleAuthInfo authInfo) async {
    await _authorizeApiRepository.linkWithGoogle(authInfo);
  }
}
