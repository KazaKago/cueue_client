import 'package:cueue/domain/model/hierarchy/user/user.dart';

abstract class GetUserUseCase {
  Future<User> call();
}
