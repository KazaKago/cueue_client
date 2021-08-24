import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/unlink_with_google_usecase.dart';

class UnlinkWithGoogleUseCaseImpl implements UnlinkWithGoogleUseCase {
  const UnlinkWithGoogleUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call() async {
    await _authorizeApiRepository.unlinkWithGoogle();
  }
}
