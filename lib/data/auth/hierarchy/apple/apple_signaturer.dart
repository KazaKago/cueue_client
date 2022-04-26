import 'package:cueue/data/auth/hierarchy/apple/apple_provider_id.dart';
import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppleSignaturer {
  const AppleSignaturer();

  Future<void> authenticate(AppleAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().signIn(() => OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }

  Future<void> reauthenticate(AppleAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().reauthenticate(() => OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }

  Future<void> link(AppleAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().link(() => OAuthProvider(const AppleProviderId().value).credential(idToken: authInfo.idToken, accessToken: authInfo.accessToken, rawNonce: authInfo.rawNonce));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }

  Future<void> unlink() async {
    try {
      await const SignaturerDelegator().unlink(const AppleProviderId());
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }
}
