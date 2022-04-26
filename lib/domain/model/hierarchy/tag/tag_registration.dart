import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_registration.freezed.dart';

@freezed
class TagRegistration with _$TagRegistration {
  const factory TagRegistration({
    required String name,
  }) = _TagRegistration;
}
