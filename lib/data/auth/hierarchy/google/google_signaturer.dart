import 'package:cueue/data/auth/hierarchy/google/google_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignaturer {
  const GoogleSignaturer();

  Future<void> authenticate(GoogleAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().signIn(() => GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }

  Future<void> reauthenticate(GoogleAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().reauthenticate(() => GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }

  Future<void> link(GoogleAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().link(() => GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }

  Future<void> unlink() async {
    try {
      await const SignaturerDelegator().unlink(const GoogleProviderId());
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }
}
