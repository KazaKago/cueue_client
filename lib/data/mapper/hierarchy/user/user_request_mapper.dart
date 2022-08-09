import 'package:cueue/data/api/request/user/user_request.dart';
import 'package:cueue/domain/model/hierarchy/user/user_registration.dart';

class UserRequestMapper {
  const UserRequestMapper();

  UserRequest map(UserRegistration userRegistration) {
    return UserRequest(
      displayName: userRegistration.displayName,
      photoKey: userRegistration.photoKey?.value,
    );
  }
}
