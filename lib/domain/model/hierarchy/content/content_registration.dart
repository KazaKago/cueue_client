import 'dart:io';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_registration.freezed.dart';

@freezed
class ContentRegistration with _$ContentRegistration {
  const factory ContentRegistration({
    required final Uint8List data,
  }) = _ContentRegistration;

  factory ContentRegistration.fromFile(final File file) {
    final contentByte = file.readAsBytesSync();
    return ContentRegistration(data: contentByte);
  }

  static const minImageWidth = 1280;
  static const minImageHeight = 1280;
  static const imageQuality = 75;
}
