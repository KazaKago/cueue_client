import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/delete_account_usecase.dart';

class DeleteAccountUseCaseImpl implements DeleteAccountUseCase {
  const DeleteAccountUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call() async {
    await _userRepository.delete();
  }
}
