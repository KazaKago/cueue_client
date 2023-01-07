import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/get_user_usecase.dart';

class GetUserUseCaseImpl implements GetUserUseCase {
  const GetUserUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<User> call() {
    return _userRepository.get();
  }
}
