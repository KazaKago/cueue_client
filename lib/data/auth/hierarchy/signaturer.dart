import 'package:cueue/data/auth/hierarchy/provider_id.dart';
import 'package:cueue/domain/model/global/exception/account_exists_with_different_credential_exception.dart';
import 'package:cueue/domain/model/global/exception/credential_already_in_use_exception.dart';
import 'package:cueue/domain/model/global/exception/network_exception.dart';
import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/global/exception/too_many_requests_exception.dart';
import 'package:cueue/domain/model/global/exception/user_token_expired_exception.dart';
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

  Future<Exception> classifyException(FirebaseAuthException exception, {RequireReauthenticationType? requireReauthenticationType}) async {
    switch (exception.code) {
      case 'network-request-failed':
        return const NetworkException();
      case 'too-many-requests':
        return const TooManyRequestsException();
      case 'credential-already-in-use':
        return const CredentialAlreadyInUseException();
      case 'account-exists-with-different-credential':
        final userSignInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(exception.email!);
        return AccountExistsWithDifferentCredentialException(userSignInMethods);
      case 'requires-recent-login':
        throw RequireReauthenticationException(requireReauthenticationType!);
      case 'user-token-expired':
        throw const UserTokenExpiredException();
      default:
        return exception;
    }
  }
}
