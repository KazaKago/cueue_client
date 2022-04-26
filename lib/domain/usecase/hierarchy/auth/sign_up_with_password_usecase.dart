import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';

abstract class SignUpWithPasswordUseCase {
  Future<void> call(PasswordAuthInfo authInfo);
}
