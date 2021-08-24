import 'package:cueue/domain/model/hierarchy/user/user_id.dart';

abstract class LoginProvider {
  UserId get uid;

  String get displayName;
}
