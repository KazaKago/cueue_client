import 'package:cueue/data/auth/hierarchy/provider_id.dart';
import 'package:cueue/domain/model/global/exception/account_exists_with_different_credential_exception.dart';
import 'package:cueue/domain/model/global/exception/credential_already_in_use_exception.dart';
import 'package:cueue/domain/model/global/exception/email_already_in_use_exception.dart';
import 'package:cueue/domain/model/global/exception/email_validation_exception.dart';
import 'package:cueue/domain/model/global/exception/network_exception.dart';
import 'package:cueue/domain/model/global/exception/password_validation_exception.dart';
import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/global/exception/too_many_requests_exception.dart';
import 'package:cueue/domain/model/global/exception/user_not_found_exception.dart';
import 'package:cueue/domain/model/global/exception/user_token_expired_exception.dart';
import 'package:cueue/domain/model/global/exception/wrong_password_exception.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignaturerDelegator {
  const SignaturerDelegator();

  Future<void> signIn(AuthCredential Function() getCredential) async {
    final credential = getCredential();
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> link(AuthCredential Function() getCredential) async {
    final credential = getCredential();
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser?.linkWithCredential(credential);
  }

  Future<void> unlink(ProviderId providerId) async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser?.unlink(providerId.value);
  }

  Future<void> reauthenticate(AuthCredential Function() getCredential) async {
    final credential = getCredential();
    final firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser?.reauthenticateWithCredential(credential);
  }

  Future<Exception> classifyException(FirebaseAuthException exception, {Email? email, Password? password, RequireReauthenticationType? requireReauthenticationType}) async {
    switch (exception.code) {
      case 'network-request-failed':
        return const NetworkException();
      case 'too-many-requests':
        return const TooManyRequestsException();
      case 'email-already-in-use':
        return EmailAlreadyInUseException(email?.value ?? '');
      case 'credential-already-in-use':
        return const CredentialAlreadyInUseException();
      case 'account-exists-with-different-credential':
        final userSignInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(exception.email!);
        return AccountExistsWithDifferentCredentialException(userSignInMethods);
      case 'wrong-password':
        return WrongPasswordException(password?.value ?? '');
      case 'user-not-found':
        throw UserNotFoundException(email?.value ?? '');
      case 'invalid-credential':
        throw EmailValidationException(email?.value ?? '');
      case 'requires-recent-login':
        throw RequireReauthenticationException(requireReauthenticationType!);
      case 'weak-password':
        throw PasswordValidationException(password?.value ?? '');
      case 'user-token-expired':
        throw const UserTokenExpiredException();
      default:
        return exception;
    }
  }
}
