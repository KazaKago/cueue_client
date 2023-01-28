import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUser {
  FirebaseUser(this._rawUser);

  final auth.User _rawUser;

  String? get displayName => _rawUser.displayName;

  String? get email => _rawUser.email;

  String? get photoURL => _rawUser.photoURL;

  List<auth.UserInfo> get providerData => _rawUser.providerData;

  Future<void> reauthenticateWithCredential(AuthCredential credential) => _rawUser.reauthenticateWithCredential(credential);

  Future<void> linkWithCredential(AuthCredential credential) => _rawUser.linkWithCredential(credential);

  Future<void> unlink(String providerId) => _rawUser.unlink(providerId);

  Future<void> delete() => _rawUser.delete();

  @override
  String toString() => _rawUser.toString();
}
