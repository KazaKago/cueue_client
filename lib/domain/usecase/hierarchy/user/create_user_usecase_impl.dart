import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/create_user_usecase.dart';

class CreateUserUseCaseImpl implements CreateUserUseCase {
  const CreateUserUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<void> call(UserRegistration userRegistration) {
    return _userRepository.create(userRegistration);
  }
}
