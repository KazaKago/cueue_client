import 'package:cueue/domain/model/hierarchy/user/login_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_provider.freezed.dart';

@freezed
class AppleProvider with _$AppleProvider implements LoginProvider {
  const factory AppleProvider({
    required String uid,
    required String? email,
    required String displayName,
  }) = _AppleProvider;
}
