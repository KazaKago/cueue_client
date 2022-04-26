import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/sign_in_with_password_usecase.dart';

class SignInWithPasswordUseCaseImpl implements SignInWithPasswordUseCase {
  const SignInWithPasswordUseCaseImpl(this._authorizeApiRepository);

  final AuthorizeRepository _authorizeApiRepository;

  @override
  Future<void> call(PasswordAuthInfo authInfo) async {
    await _authorizeApiRepository.signInWithPassword(authInfo);
  }
}
