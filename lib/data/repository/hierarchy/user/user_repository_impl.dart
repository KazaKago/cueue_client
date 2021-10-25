import 'package:cueue/data/api/hierarchy/user/create_user_api.dart';
import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/auth/hierarchy/password/password_signaturer.dart';
import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:cueue/data/cache/hierarchy/user/user_cache.dart';
import 'package:cueue/data/cache/hierarchy/user/user_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:store_flowable/store_flowable.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._userCache, this._userStateManager, this._getUserApi, this._createUserApi, this._userResponseMapper, this._passwordSignaturer);

  final UserCache _userCache;
  final UserStateManager _userStateManager;
  final GetUserApi _getUserApi;
  final CreateUserApi _createUserApi;
  final UserResponseMapper _userResponseMapper;
  final PasswordSignaturer _passwordSignaturer;

  @override
  Future<LoadingStateStream<User>> follow() {
    final userFlowable = UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create();
    return userFlowable.publish();
  }

  @override
  Future<User> get() {
    final userFlowable = UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create();
    return userFlowable.requireData();
  }

  @override
  Future<User?> getOrNull() {
    final userFlowable = UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create();
    return userFlowable.getData();
  }

  @override
  Future<void> refresh() async {
    final userFlowable = UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create();
    await userFlowable.refresh();
  }

  @override
  Future<void> create() async {
    await _createUserApi.execute();
  }

  @override
  Future<void> updateEmail(final Email email) async {
    await _passwordSignaturer.updateEmail(email);
    final userFlowable = UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create();
    await userFlowable.refresh();
  }

  @override
  Future<void> updatePassword(final Password password) async {
    await _passwordSignaturer.updatePassword(password);
    final userFlowable = UserFlowableFactory(_userCache, _userStateManager, _getUserApi, _userResponseMapper).create();
    await userFlowable.refresh();
  }

  @override
  Future<void> sendEmailVerification() async {
    final firebaseUser = auth.FirebaseAuth.instance.currentUser!;
    await firebaseUser.sendEmailVerification();
  }

  @override
  Future<void> sendPasswordResetEmail(final Email email) async {
    try {
      await auth.FirebaseAuth.instance.sendPasswordResetEmail(email: email.value);
    } on auth.FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, email: email);
    }
  }
}
