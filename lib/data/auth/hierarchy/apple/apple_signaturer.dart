import 'package:cueue/data/auth/hierarchy/apple/apple_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/firebase_auth_extension.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppleSignaturer {
  const AppleSignaturer();

  Future<void> authenticate(AppleAuthInfo authInfo) async {
    try {
      final credential = OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce);
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }

  Future<void> reauthenticate(AppleAuthInfo authInfo) async {
    try {
      final credential = OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce);
      await FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }

  Future<void> link(AppleAuthInfo authInfo) async {
    try {
      final credential = OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce);
      await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }

  Future<void> unlink() async {
    try {
      const providerId = AppleProviderId();
      await FirebaseAuth.instance.currentUser?.unlink(providerId.value);
    } on FirebaseAuthException catch (exception) {
      throw await exception.parse();
    }
  }
}
