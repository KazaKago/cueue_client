// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ContentKeyTearOff {
  const _$ContentKeyTearOff();

  _ContentKey call(String value) {
    return _ContentKey(
      value,
    );
  }
}

/// @nodoc
const $ContentKey = _$ContentKeyTearOff();

/// @nodoc
mixin _$ContentKey {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentKeyCopyWith<ContentKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentKeyCopyWith<$Res> {
  factory $ContentKeyCopyWith(
          ContentKey value, $Res Function(ContentKey) then) =
      _$ContentKeyCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$ContentKeyCopyWithImpl<$Res> implements $ContentKeyCopyWith<$Res> {
  _$ContentKeyCopyWithImpl(this._value, this._then);

  final ContentKey _value;
  // ignore: unused_field
  final $Res Function(ContentKey) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ContentKeyCopyWith<$Res> implements $ContentKeyCopyWith<$Res> {
  factory _$ContentKeyCopyWith(
          _ContentKey value, $Res Function(_ContentKey) then) =
      __$ContentKeyCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$ContentKeyCopyWithImpl<$Res> extends _$ContentKeyCopyWithImpl<$Res>
    implements _$ContentKeyCopyWith<$Res> {
  __$ContentKeyCopyWithImpl(
      _ContentKey _value, $Res Function(_ContentKey) _then)
      : super(_value, (v) => _then(v as _ContentKey));

  @override
  _ContentKey get _value => super._value as _ContentKey;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_ContentKey(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ContentKey implements _ContentKey {
  const _$_ContentKey(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ContentKey(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentKey &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$ContentKeyCopyWith<_ContentKey> get copyWith =>
      __$ContentKeyCopyWithImpl<_ContentKey>(this, _$identity);
}

abstract class _ContentKey implements ContentKey {
  const factory _ContentKey(String value) = _$_ContentKey;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$ContentKeyCopyWith<_ContentKey> get copyWith =>
      throw _privateConstructorUsedError;
}
