import 'package:cueue/data/auth/hierarchy/apple/apple_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/google/google_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/password/password_signaturer.dart';
import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/auth/apple_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/google_auth_info.dart';
import 'package:cueue/domain/model/hierarchy/auth/password_auth_info.dart';
import 'package:cueue/domain/repository/hierarchy/auth/authorize_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:store_flowable/store_flowable.dart';

class AuthorizeRepositoryImpl implements AuthorizeRepository {
  const AuthorizeRepositoryImpl(this._passwordSignaturer, this._googleSignaturer, this._appleSignaturer, this._cacheList, this._userFlowableFactory);

  final PasswordSignaturer _passwordSignaturer;
  final GoogleSignaturer _googleSignaturer;
  final AppleSignaturer _appleSignaturer;
  final List<Cache> _cacheList;
  final UserFlowableFactory _userFlowableFactory;

  @override
  Future<bool> isSignIn() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Future<void> signUpWithPassword(final PasswordAuthInfo authInfo) async {
    await _passwordSignaturer.signUp(authInfo);
  }

  @override
  Future<void> signInWithPassword(final PasswordAuthInfo authInfo) async {
    await _passwordSignaturer.signIn(authInfo);
  }

  @override
  Future<void> authenticateWithGoogle(final GoogleAuthInfo authInfo) async {
    await _googleSignaturer.authenticate(authInfo);
  }

  @override
  Future<void> authenticateWithApple(final AppleAuthInfo authInfo) async {
    await _appleSignaturer.authenticate(authInfo);
  }

  @override
  Future<void> reauthenticateWithPassword(final PasswordAuthInfo authInfo) async {
    await _passwordSignaturer.reauthenticate(authInfo);
  }

  @override
  Future<void> reauthenticateWithGoogle(GoogleAuthInfo authInfo) async {
    await _googleSignaturer.reauthenticate(authInfo);
  }

  @override
  Future<void> reauthenticateWithApple(AppleAuthInfo authInfo) async {
    await _appleSignaturer.reauthenticate(authInfo);
  }

  @override
  Future<void> linkWithGoogle(final GoogleAuthInfo authInfo) async {
    await _googleSignaturer.link(authInfo);
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<void> linkWithApple(final AppleAuthInfo authInfo) async {
    await _appleSignaturer.link(authInfo);
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<void> unlinkWithGoogle() async {
    await _googleSignaturer.unlink();
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<void> unlinkWithApple() async {
    await _appleSignaturer.unlink();
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _deleteAllCache();
  }

  void _deleteAllCache() {
    for (final cache in _cacheList) {
      cache.clearAll();
    }
  }
}
