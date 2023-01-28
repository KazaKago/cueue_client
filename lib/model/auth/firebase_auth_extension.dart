import 'package:cueue/model/exception/account_exists_with_different_credential_exception.dart';
import 'package:cueue/model/exception/credential_already_in_use_exception.dart';
import 'package:cueue/model/exception/network_exception.dart';
import 'package:cueue/model/exception/require_reautentication_exception.dart';
import 'package:cueue/model/exception/too_many_requests_exception.dart';
import 'package:cueue/model/exception/user_token_expired_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseAuthExtension on FirebaseAuthException {
  Future<Exception> parse({RequireReauthenticationType? requireReauthenticationType}) async {
    switch (code) {
      case 'network-request-failed':
        return const NetworkException();
      case 'too-many-requests':
        return const TooManyRequestsException();
      case 'credential-already-in-use':
        return const CredentialAlreadyInUseException();
      case 'account-exists-with-different-credential':
        final userSignInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email!);
        return AccountExistsWithDifferentCredentialException(userSignInMethods);
      case 'requires-recent-login':
        throw RequireReauthenticationException(requireReauthenticationType!);
      case 'user-token-expired':
        throw const UserTokenExpiredException();
      default:
        return this;
    }
  }
}
