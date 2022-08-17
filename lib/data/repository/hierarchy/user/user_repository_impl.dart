import 'package:cueue/data/api/hierarchy/user/create_user_api.dart';
import 'package:cueue/data/api/hierarchy/user/update_user_api.dart';
import 'package:cueue/data/auth/hierarchy/firebase_auth_extension.dart';
import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_request_mapper.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_flowable/store_flowable.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._cacheList, this._createUserApi, this._updateUserApi, this._userFlowableFactory, this._userResponseMapper, this._userRequestMapper);

  final List<Cache> _cacheList;
  final CreateUserApi _createUserApi;
  final UpdateUserApi _updateUserApi;
  final UserFlowableFactory _userFlowableFactory;
  final UserResponseMapper _userResponseMapper;
  final UserRequestMapper _userRequestMapper;

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
  Future<void> refresh() async {
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.refresh();
  }

  @override
  Future<User> create(UserRegistration userRegistration) async {
    final userResponse = await _createUserApi.execute(_userRequestMapper.map(userRegistration));
    final user = _userResponseMapper.map(auth.FirebaseAuth.instance.currentUser!, userResponse);
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.update(user);
    return user;
  }

  @override
  Future<void> update(UserRegistration userRegistration) async {
    final userResponse = await _updateUserApi.execute(_userRequestMapper.map(userRegistration));
    final user = _userResponseMapper.map(auth.FirebaseAuth.instance.currentUser!, userResponse);
    final userFlowable = _userFlowableFactory.create(null);
    await userFlowable.update(user);
  }

  @override
  Future<void> delete() async {
    try {
      await auth.FirebaseAuth.instance.currentUser!.delete();
      final googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
      for (final cache in _cacheList) {
        cache.clearAll();
      }
    } on auth.FirebaseAuthException catch (exception) {
      throw await exception.parse(requireReauthenticationType: const RequireReauthenticationType.deleteAccount());
    }
  }
}
