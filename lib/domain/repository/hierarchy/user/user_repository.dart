import 'package:cueue/domain/model/hierarchy/content/content_registration.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';
import 'package:store_flowable/store_flowable_core.dart';

abstract class UserRepository {
  LoadingStateStream<User> follow();

  Future<User> get();

  Future<User?> getOrNull();

  Future<void> refresh();

  Future<User> create();

  Future<void> updateDisplayName(String displayName);

  Future<void> updatePhoto(ContentRegistration contentRegistration);

  Future<void> delete();
}
