import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:store_flowable/store_flowable_core.dart';

abstract class UserRepository {
  LoadingStateStream<User> follow();

  Future<User> get();

  Future<void> refresh();

  Future<User> create(UserRegistration userRegistration);

  Future<void> update(UserRegistration userRegistration);

  Future<void> delete();

  Future<auth.User> getPreUserInfo();
}
