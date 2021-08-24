import 'package:cueue/domain/model/hierarchy/user/login_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_provider.freezed.dart';

@freezed
class PasswordProvider with _$PasswordProvider implements LoginProvider {
  const factory PasswordProvider({
    required final UserId uid,
    required final String displayName,
  }) = _PasswordProvider;
}
