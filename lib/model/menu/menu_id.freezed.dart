// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuId {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuIdCopyWith<MenuId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuIdCopyWith<$Res> {
  factory $MenuIdCopyWith(MenuId value, $Res Function(MenuId) then) = _$MenuIdCopyWithImpl<$Res, MenuId>;

  @useResult
  $Res call({int value});
}

/// @nodoc
class _$MenuIdCopyWithImpl<$Res, $Val extends MenuId> implements $MenuIdCopyWith<$Res> {
  _$MenuIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuIdCopyWith<$Res> implements $MenuIdCopyWith<$Res> {
  factory _$$_MenuIdCopyWith(_$_MenuId value, $Res Function(_$_MenuId) then) = __$$_MenuIdCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_MenuIdCopyWithImpl<$Res> extends _$MenuIdCopyWithImpl<$Res, _$_MenuId> implements _$$_MenuIdCopyWith<$Res> {
  __$$_MenuIdCopyWithImpl(_$_MenuId _value, $Res Function(_$_MenuId) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_MenuId(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MenuId implements _MenuId {
  const _$_MenuId(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'MenuId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_MenuId && (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuIdCopyWith<_$_MenuId> get copyWith => __$$_MenuIdCopyWithImpl<_$_MenuId>(this, _$identity);
}

abstract class _MenuId implements MenuId {
  const factory _MenuId(final int value) = _$_MenuId;

  @override
  int get value;

  @override
  @JsonKey(ignore: true)
  _$$_MenuIdCopyWith<_$_MenuId> get copyWith => throw _privateConstructorUsedError;
}