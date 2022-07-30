import 'package:cueue/data/auth/hierarchy/firebase_auth_extension.dart';
import 'package:cueue/data/auth/hierarchy/google/google_provider_id.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleSignaturer {
  const GoogleSignaturer();

  Future<void> authenticate(GoogleAuthInfo authInfo) async {
    try {
      final credential = GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken);
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }

  Future<void> reauthenticate(GoogleAuthInfo authInfo) async {
    try {
      final credential = GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken);
      await FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }

  Future<void> link(GoogleAuthInfo authInfo) async {
    try {
      final credential = GoogleAuthProvider.credential(accessToken: authInfo.accessToken, idToken: authInfo.idToken);
      await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }

  Future<void> unlink() async {
    try {
      const providerId = GoogleProviderId();
      await FirebaseAuth.instance.currentUser?.unlink(providerId.value);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }
}
