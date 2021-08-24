// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'menu_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MenuIdTearOff {
  const _$MenuIdTearOff();

  _MenuId call(int value) {
    return _MenuId(
      value,
    );
  }
}

/// @nodoc
const $MenuId = _$MenuIdTearOff();

/// @nodoc
mixin _$MenuId {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuIdCopyWith<MenuId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuIdCopyWith<$Res> {
  factory $MenuIdCopyWith(MenuId value, $Res Function(MenuId) then) =
      _$MenuIdCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$MenuIdCopyWithImpl<$Res> implements $MenuIdCopyWith<$Res> {
  _$MenuIdCopyWithImpl(this._value, this._then);

  final MenuId _value;
  // ignore: unused_field
  final $Res Function(MenuId) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MenuIdCopyWith<$Res> implements $MenuIdCopyWith<$Res> {
  factory _$MenuIdCopyWith(_MenuId value, $Res Function(_MenuId) then) =
      __$MenuIdCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$MenuIdCopyWithImpl<$Res> extends _$MenuIdCopyWithImpl<$Res>
    implements _$MenuIdCopyWith<$Res> {
  __$MenuIdCopyWithImpl(_MenuId _value, $Res Function(_MenuId) _then)
      : super(_value, (v) => _then(v as _MenuId));

  @override
  _MenuId get _value => super._value as _MenuId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_MenuId(
      value == freezed
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
    return identical(this, other) ||
        (other is _MenuId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$MenuIdCopyWith<_MenuId> get copyWith =>
      __$MenuIdCopyWithImpl<_MenuId>(this, _$identity);
}

abstract class _MenuId implements MenuId {
  const factory _MenuId(int value) = _$_MenuId;

  @override
  int get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuIdCopyWith<_MenuId> get copyWith => throw _privateConstructorUsedError;
}
