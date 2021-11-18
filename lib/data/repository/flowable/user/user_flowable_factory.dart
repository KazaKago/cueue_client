import 'package:cueue/data/api/hierarchy/user/get_user_api.dart';
import 'package:cueue/data/api/response/user/user_response.dart';
import 'package:cueue/data/cache/hierarchy/user/user_cache.dart';
import 'package:cueue/data/cache/hierarchy/user/user_state_manager.dart';
import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:store_flowable/store_flowable.dart';

class UserFlowableFactory extends StoreFlowableFactory<void, User> {
  UserFlowableFactory(this._userCache, this._userStateManager, this._getUserApi, this._userResponseMapper) : super();

  final UserCache _userCache;
  final UserStateManager _userStateManager;
  final GetUserApi _getUserApi;
  final UserResponseMapper _userResponseMapper;

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => _userStateManager;

  @override
  Future<User?> loadDataFromCache(final void param) async {
    return _userCache.user;
  }

  @override
  Future<void> saveDataToCache(final User? data, final void param) async {
    _userCache
      ..user = data
      ..userCreatedAt = DateTime.now();
  }

  @override
  Future<User> fetchDataFromOrigin(final void param) async {
    final firebaseUser = auth.FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      final result = await Future.wait<dynamic>([
        firebaseUser.reload(),
        _getUserApi.execute(),
      ]);
      final userResponse = result[1] as UserResponse;
      return _userResponseMapper.map(firebaseUser, userResponse);
    } else {
      throw const NoSuchElementException();
    }
  }

  @override
  Future<bool> needRefresh(final User cachedData, final void param) async {
    final createdAt = _userCache.userCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
