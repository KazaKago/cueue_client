import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/link_with_apple_usecase.dart';

class LinkWithAppleUseCaseImpl implements LinkWithAppleUseCase {
  const LinkWithAppleUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call(final AppleAuthInfo authInfo) async {
    await _authorizeApiRepository.linkWithApple(authInfo);
  }
}
