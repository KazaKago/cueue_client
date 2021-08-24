import 'package:cueue/data/mapper/hierarchy/user/user_response_mapper.dart';
import 'package:cueue/data/memory/hierarchy/user/user_cache.dart';
import 'package:cueue/data/memory/hierarchy/user/user_state_manager.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:store_flowable/store_flowable.dart';

class UserFlowableFactory extends StoreFlowableFactory<void, User> {
  UserFlowableFactory(this._userResponseMapper) : super();

  final UserResponseMapper _userResponseMapper;

  @override
  void getKey() {}

  @override
  FlowableDataStateManager<void> getFlowableDataStateManager() => UserStateManager.sharedInstance;

  @override
  Future<User?> loadDataFromCache() async {
    return UserCache.sharedInstance.user;
  }

  @override
  Future<void> saveDataToCache(final User? data) async {
    UserCache.sharedInstance.user = data;
    UserCache.sharedInstance.userCreatedAt = DateTime.now();
  }

  @override
  Future<User> fetchDataFromOrigin() async {
    final firebaseUser = auth.FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await firebaseUser.reload();
      return _userResponseMapper.map(firebaseUser);
    } else {
      throw const NoSuchElementException();
    }
  }

  @override
  Future<bool> needRefresh(final User cachedData) async {
    final createdAt = UserCache.sharedInstance.userCreatedAt;
    if (createdAt != null) {
      final expiredTime = createdAt.add(const Duration(minutes: 30));
      return DateTime.now().isAfter(expiredTime);
    } else {
      return true;
    }
  }
}
