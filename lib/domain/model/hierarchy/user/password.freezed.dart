// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Password {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordCopyWith<Password> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordCopyWith<$Res> {
  factory $PasswordCopyWith(Password value, $Res Function(Password) then) =
      _$PasswordCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$PasswordCopyWithImpl<$Res> implements $PasswordCopyWith<$Res> {
  _$PasswordCopyWithImpl(this._value, this._then);

  final Password _value;
  // ignore: unused_field
  final $Res Function(Password) _then;

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
abstract class _$$_PasswordCopyWith<$Res> implements $PasswordCopyWith<$Res> {
  factory _$$_PasswordCopyWith(
          _$_Password value, $Res Function(_$_Password) then) =
      __$$_PasswordCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$$_PasswordCopyWithImpl<$Res> extends _$PasswordCopyWithImpl<$Res>
    implements _$$_PasswordCopyWith<$Res> {
  __$$_PasswordCopyWithImpl(
      _$_Password _value, $Res Function(_$_Password) _then)
      : super(_value, (v) => _then(v as _$_Password));

  @override
  _$_Password get _value => super._value as _$_Password;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Password(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Password extends _Password {
  _$_Password(this.value) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'Password(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Password &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordCopyWith<_$_Password> get copyWith =>
      __$$_PasswordCopyWithImpl<_$_Password>(this, _$identity);
}

abstract class _Password extends Password {
  factory _Password(final String value) = _$_Password;
  _Password._() : super._();

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordCopyWith<_$_Password> get copyWith =>
      throw _privateConstructorUsedError;
}
