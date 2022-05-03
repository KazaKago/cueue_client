import 'package:cueue/data/api/hierarchy/user/create_user_api.dart';
import 'package:cueue/data/auth/hierarchy/password/password_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:store_flowable/store_flowable.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._cacheList, this._createUserApi, this._passwordSignaturer, this._userFlowableFactory);

  final List<Cache> _cacheList;
  final CreateUserApi _createUserApi;
  final PasswordSignaturer _passwordSignaturer;
  final UserFlowableFactory _userFlowableFactory;

  @override
  LoadingStateStream<User> follow() {
    final userFlowable = _userFlowableFactory.create(null);
    return userFlowable.publish();
  }

  @override
  Future<User> get() {
    final userFlowable = _userFlowableFactory.create(null);
    return userFlowable.requireData();
  }

  @override
  Future<User?> getOrNull() {
    final userFlowable = _userFlowableFactory.create(null);
    return userFlowable.getData();
  }

  @override
  Future<void> refresh() async {
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<void> create() async {
    await _createUserApi.execute();
  }

  @override
  Future<void> updateEmail(Email email) async {
    await _passwordSignaturer.updateEmail(email);
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<void> updatePassword(Password password) async {
    await _passwordSignaturer.updatePassword(password);
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<void> sendEmailVerification() async {
    final firebaseUser = auth.FirebaseAuth.instance.currentUser!;
    await firebaseUser.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail(Email email) async {
    try {
      await auth.FirebaseAuth.instance.sendPasswordResetEmail(email: email.value);
    } on auth.FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, email: email);
    }
  }

  @override
  Future<void> delete() async {
    await auth.FirebaseAuth.instance.currentUser!.delete();
    for (final cache in _cacheList) {
      cache.clearAll();
    }
  }
}
