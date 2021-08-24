import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/is_sign_in_usecase.dart';

class IsSignInUseCaseImpl implements IsSignInUseCase {
  const IsSignInUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<bool> call() {
    return _authorizeApiRepository.isSignIn();
  }
}
