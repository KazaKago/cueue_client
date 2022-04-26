import 'package:cueue/domain/model/hierarchy/user/email.dart';

abstract class SendPasswordResetMailUseCase {
  Future<void> call(Email email);
}
