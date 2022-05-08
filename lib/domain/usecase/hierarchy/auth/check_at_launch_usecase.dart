import 'package:cueue/domain/model/hierarchy/auth/launch_check_result.dart';

abstract class CheckAtLaunchUseCase {
  Future<LaunchCheckResult> call();
}
