import 'package:cueue/domain/model/hierarchy/user/email.dart';
import 'package:cueue/domain/model/hierarchy/user/password.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class UserRepository {
  LoadingStateStream<User> follow();

  Future<User> get();

  Future<User?> getOrNull();

  Future<void> refresh();

  Future<void> create();

  Future<void> updateEmail(Email email);

  Future<void> updatePassword(Password password);

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(Email email);

  Future<void> delete();
}
