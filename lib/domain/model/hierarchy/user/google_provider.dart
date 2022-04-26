import 'package:cueue/domain/model/hierarchy/user/login_provider.dart';
import 'package:cueue/domain/model/hierarchy/user/user_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_provider.freezed.dart';

@freezed
class GoogleProvider with _$GoogleProvider implements LoginProvider {
  const factory GoogleProvider({
    required UserId uid,
    required String displayName,
  }) = _GoogleProvider;
}
