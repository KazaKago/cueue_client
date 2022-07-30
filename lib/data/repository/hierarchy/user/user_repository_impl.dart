import 'package:cueue/data/api/hierarchy/user/create_user_api.dart';
import 'package:cueue/data/auth/hierarchy/signaturer.dart';
import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/repository/flowable/user/user_flowable_factory.dart';
import 'package:cueue/domain/model/global/exception/require_reautentication_exception.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/repository/hierarchy/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_flowable/store_flowable.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._cacheList, this._createUserApi, this._userFlowableFactory, this._userResponseMapper);

  final List<Cache> _cacheList;
  final CreateUserApi _createUserApi;
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
  Future<void> delete() async {
    try {
      await auth.FirebaseAuth.instance.currentUser!.delete();
      final googleSignIn = GoogleSignIn();
      if (await googleSignIn.isSignedIn()) await googleSignIn.signOut();
      for (final cache in _cacheList) {
        cache.clearAll();
      }
    } on auth.FirebaseAuthException catch (exception) {
      throw await const SignaturerDelegator().classifyException(exception, requireReauthenticationType: const RequireReauthenticationType.deleteAccount());
    }
  }
}
