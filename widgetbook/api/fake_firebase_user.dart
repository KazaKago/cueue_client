import 'package:cueue/gen/assets.gen.dart';
import 'package:cueue/model/auth/firebase_user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class FakeFirebaseUser implements FirebaseUser {
  const FakeFirebaseUser();

  @override
  String? get displayName => 'display name';

  @override
  String? get email => 'hogehoge@gmail.com';

  @override
  String? get photoURL => Assets.images.time1Asa.path;

  @override
  List<auth.UserInfo> get providerData => [];

  @override
  Future<void> delete() async {}

  @override
  Future<void> linkWithCredential(auth.AuthCredential credential) async {}

  @override
  Future<void> reauthenticateWithCredential(auth.AuthCredential credential) async {}

  @override
  Future<void> unlink(String providerId) async {}
}
