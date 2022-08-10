import 'package:cueue/domain/model/hierarchy/user/login_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_provider.freezed.dart';

@freezed
class GoogleProvider with _$GoogleProvider implements LoginProvider {
  const factory GoogleProvider({
    required String uid,
    required String? email,
    required String displayName,
  }) = _GoogleProvider;
}
