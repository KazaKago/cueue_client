import 'package:cueue/legacy/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/legacy/domain/usecase/hierarchy/auth/sign_out_usecase.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  const SignOutUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call() async {
    await _authorizeApiRepository.signOut();
  }
}