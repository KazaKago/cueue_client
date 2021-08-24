import 'package:cueue/domain/model/hierarchy/user/user.dart';

class UserCache {
  static UserCache sharedInstance = UserCache();

  User? user;
  DateTime? userCreatedAt;

  void clearAll() {
    user = null;
    userCreatedAt = null;
  }
}
