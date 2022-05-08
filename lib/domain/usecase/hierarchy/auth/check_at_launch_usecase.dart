import 'package:cueue/domain/usecase/hierarchy/auth/launch_check_result.dart';

abstract class CheckAtLaunchUseCase {
  Future<LaunchCheckResult> call();
}
