import 'package:cueue/domain/model/hierarchy/auth/launch_check_result.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/check_at_launch_usecase.dart';

class CheckAtLaunchUseCaseImpl implements CheckAtLaunchUseCase {
  const CheckAtLaunchUseCaseImpl(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<LaunchCheckResult> call() async {
    final user = await _userRepository.getOrNull();
    if (user == null) {
      return LaunchCheckResult.beforeSignIn;
    } else if (user.workspaces.isEmpty) {
      return LaunchCheckResult.workspaceCreation;
    } else {
      return LaunchCheckResult.afterSignIn;
    }
  }
}
