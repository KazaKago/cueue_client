import 'package:cueue/domain/model/hierarchy/user/pre_user.dart';

abstract class GetPreUserInfoUseCase {
  Future<PreUser> call();
}
