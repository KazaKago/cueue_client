import 'package:cueue/domain/model/hierarchy/user/password.dart';

abstract class UpdatePasswordUseCase {
  Future<void> call(Password password);
}
