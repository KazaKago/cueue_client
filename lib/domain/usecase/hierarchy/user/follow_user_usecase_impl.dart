import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/user/follow_user_usecase.dart';
import 'package:store_flowable/store_flowable_core.dart';

class FollowUserUseCaseImpl implements FollowUserUseCase {
  const FollowUserUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  LoadingStateStream<User> call() {
    return _userRepository.follow();
  }
}
