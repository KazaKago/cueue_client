import 'package:cueue/data/cache/hierarchy/cache.dart';
import 'package:cueue/domain/model/hierarchy/user/user.dart';

class UserCache implements Cache {
  User? user;
  DateTime? userCreatedAt;

  @override
  void clearAll() {
    user = null;
    userCreatedAt = null;
  }
}
