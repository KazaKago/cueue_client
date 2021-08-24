import 'package:cueue/domain/model/hierarchy/user/email.dart';

abstract class UpdateEmailUseCase {
  Future<void> call(final Email email);
}
