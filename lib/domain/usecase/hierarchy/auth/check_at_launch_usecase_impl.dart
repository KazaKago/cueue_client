import 'package:cueue/domain/model/global/exception/not_found_exception.dart';
import 'package:cueue/domain/model/hierarchy/auth/launch_check_result.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:cueue/domain/usecase/hierarchy/auth/check_at_launch_usecase.dart';

class CheckAtLaunchUseCaseImpl implements CheckAtLaunchUseCase {
  const CheckAtLaunchUseCaseImpl(this._userRepository, this._authorizeRepository);

  final UserRepository _userRepository;
  final AuthorizeRepository _authorizeRepository;

  @override
  Future<LaunchCheckResult> call() async {
    final isSignIn = await _authorizeRepository.isSignIn();
    if (!isSignIn) {
      return LaunchCheckResult.beforeSignIn;
    } else {
      try {
        final user = await _userRepository.get();
        if (user.workspace == null) {
          return LaunchCheckResult.workspaceCreation;
        } else {
          return LaunchCheckResult.afterSignIn;
        }
      } on NotFoundException catch (_) {
        return LaunchCheckResult.userCreation;
      }
    }
  }
}
