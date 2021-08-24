import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_id.freezed.dart';

@freezed
class MenuId with _$MenuId {
  const factory MenuId(final int value) = _MenuId;
}
