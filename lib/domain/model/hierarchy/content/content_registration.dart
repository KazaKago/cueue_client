import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'content_registration.freezed.dart';

@freezed
class ContentRegistration with _$ContentRegistration {
  const factory ContentRegistration.file({
    required File file,
  }) = _File;

  const factory ContentRegistration.uri({
    required Uri uri,
  }) = _Uri;
}
