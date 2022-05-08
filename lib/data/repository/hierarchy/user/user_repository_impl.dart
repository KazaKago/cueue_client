import 'package:cueue/data/api/hierarchy/user/create_user_api.dart';
import 'package:cueue/data/api/hierarchy/user/delete_user_api.dart';
import 'package:cueue/data/auth/hierarchy/password/password_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:store_flowable/store_flowable.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._cacheList, this._createUserApi, this._deleteUserApi, this._passwordSignaturer, this._userFlowableFactory, this._userResponseMapper);

  final List<Cache> _cacheList;
  final CreateUserApi _createUserApi;
  final DeleteUserApi _deleteUserApi;
  final PasswordSignaturer _passwordSignaturer;
  final UserFlowableFactory _userFlowableFactory;
  final UserResponseMapper _userResponseMapper;

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
  Future<User> create() async {
    final userResponse = await _createUserApi.execute();
    final user = _userResponseMapper.map(auth.FirebaseAuth.instance.currentUser!, userResponse);
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.update(user);
    return user;
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
    try {
      await _deleteUserApi.execute();
      await auth.FirebaseAuth.instance.currentUser!.delete();
      for (final cache in _cacheList) {
        cache.clearAll();
      }
    } on auth.FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, requireReauthenticationType: const RequireReauthenticationType.deleteAccount());
    }
  }
}
