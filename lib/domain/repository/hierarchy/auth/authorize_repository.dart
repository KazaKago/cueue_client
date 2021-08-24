import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';

abstract class AuthorizeRepository {
  Future<bool> isSignIn();

  Future<void> signUpWithPassword(final PasswordAuthInfo authInfo);

  Future<void> signInWithPassword(final PasswordAuthInfo authInfo);

  Future<void> authenticateWithGoogle(final GoogleAuthInfo authInfo);

  Future<void> authenticateWithApple(final AppleAuthInfo authInfo);

  Future<void> reauthenticateWithPassword(final PasswordAuthInfo authInfo);

  Future<void> reauthenticateWithGoogle(final GoogleAuthInfo authInfo);

  Future<void> reauthenticateWithApple(final AppleAuthInfo authInfo);

  Future<void> linkWithGoogle(final GoogleAuthInfo authInfo);

  Future<void> linkWithApple(final AppleAuthInfo authInfo);

  Future<void> unlinkWithGoogle();

  Future<void> unlinkWithApple();

  Future<void> signOut();
}
