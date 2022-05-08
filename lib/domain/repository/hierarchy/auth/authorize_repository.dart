import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';

abstract class AuthorizeRepository {
  Future<void> signUpWithPassword(PasswordAuthInfo authInfo);

  Future<void> signInWithPassword(PasswordAuthInfo authInfo);

  Future<void> authenticateWithGoogle(GoogleAuthInfo authInfo);

  Future<void> authenticateWithApple(AppleAuthInfo authInfo);

  Future<void> reauthenticateWithPassword(PasswordAuthInfo authInfo);

  Future<void> reauthenticateWithGoogle(GoogleAuthInfo authInfo);

  Future<void> reauthenticateWithApple(AppleAuthInfo authInfo);

  Future<void> linkWithPassword(PasswordAuthInfo authInfo);

  Future<void> linkWithGoogle(GoogleAuthInfo authInfo);

  Future<void> linkWithApple(AppleAuthInfo authInfo);

  Future<void> unlinkWithGoogle();

  Future<void> unlinkWithApple();

  Future<void> signOut();
}
