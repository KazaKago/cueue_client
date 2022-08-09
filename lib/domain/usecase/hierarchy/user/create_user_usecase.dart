import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';

abstract class CreateUserUseCase {
  Future<void> call(UserRegistration userRegistration);
}
