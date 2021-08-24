import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/send_email_verification_usecase.dart';

class SendEmailVerificationUseCaseImpl implements SendEmailVerificationUseCase {
  const SendEmailVerificationUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call() async {
    await _userRepository.sendEmailVerification();
  }
}
