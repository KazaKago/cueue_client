import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/unlink_with_apple_usecase.dart';

class UnlinkWithAppleUseCaseImpl implements UnlinkWithAppleUseCase {
  const UnlinkWithAppleUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call() async {
    await _authorizeApiRepository.unlinkWithApple();
  }
}
