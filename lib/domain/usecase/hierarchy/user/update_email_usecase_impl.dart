import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/update_email_usecase.dart';

class UpdateEmailUseCaseImpl implements UpdateEmailUseCase {
  const UpdateEmailUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call(Email email) {
    return _userRepository.updateEmail(email);
  }
}
