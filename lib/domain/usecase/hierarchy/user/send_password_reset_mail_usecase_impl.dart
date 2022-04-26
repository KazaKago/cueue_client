import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/send_password_reset_mail_usecase.dart';

class SendPasswordResetMailUseCaseImpl implements SendPasswordResetMailUseCase {
  const SendPasswordResetMailUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call(Email email) async {
    await _userRepository.sendPasswordResetEmail(email);
  }
}
