import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PasswordSignaturer {
  const PasswordSignaturer();

  Future<void> signUp(PasswordAuthInfo authInfo) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: authInfo.email.value, password: authInfo.password.value);
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, email: authInfo.email, password: authInfo.password);
    }
  }

  Future<void> signIn(PasswordAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().signIn(() => EmailAuthProvider.credential(email: authInfo.email.value, password: authInfo.password.value));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, email: authInfo.email, password: authInfo.password);
    }
  }

  Future<void> reauthenticate(PasswordAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().reauthenticate(() => EmailAuthProvider.credential(email: authInfo.email.value, password: authInfo.password.value));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, email: authInfo.email, password: authInfo.password);
    }
  }

  Future<void> link(PasswordAuthInfo authInfo) async {
    try {
      await const SignaturerDelegator().link(() => EmailAuthProvider.credential(email: authInfo.email.value, password: authInfo.password.value));
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception);
    }
  }

  Future<void> updateEmail(Email email) async {
    try {
      final firebaseUser = FirebaseAuth.instance.currentUser!;
      await firebaseUser.updateEmail(email.value);
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, requireReauthenticationType: RequireReauthenticationType.settingEmail(email));
    }
  }

  Future<void> updatePassword(Password password) async {
    try {
      final firebaseUser = FirebaseAuth.instance.currentUser!;
      await firebaseUser.updatePassword(password.value);
    } on FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, requireReauthenticationType: RequireReauthenticationType.settingPassword(password));
    }
  }
}
