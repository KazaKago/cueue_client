// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PasswordAuthInfo {
  Email get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordAuthInfoCopyWith<PasswordAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordAuthInfoCopyWith<$Res> {
  factory $PasswordAuthInfoCopyWith(
          PasswordAuthInfo value, $Res Function(PasswordAuthInfo) then) =
      _$PasswordAuthInfoCopyWithImpl<$Res>;
  $Res call({Email email, Password password});

  $EmailCopyWith<$Res> get email;
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class _$PasswordAuthInfoCopyWithImpl<$Res>
    implements $PasswordAuthInfoCopyWith<$Res> {
  _$PasswordAuthInfoCopyWithImpl(this._value, this._then);

  final PasswordAuthInfo _value;
  // ignore: unused_field
  final $Res Function(PasswordAuthInfo) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }

  @override
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value));
    });
  }

  @override
  $PasswordCopyWith<$Res> get password {
    return $PasswordCopyWith<$Res>(_value.password, (value) {
      return _then(_value.copyWith(password: value));
    });
  }
}

/// @nodoc
abstract class _$$_PasswordAuthInfoCopyWith<$Res>
    implements $PasswordAuthInfoCopyWith<$Res> {
  factory _$$_PasswordAuthInfoCopyWith(
          _$_PasswordAuthInfo value, $Res Function(_$_PasswordAuthInfo) then) =
      __$$_PasswordAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({Email email, Password password});

  @override
  $EmailCopyWith<$Res> get email;
  @override
  $PasswordCopyWith<$Res> get password;
}

/// @nodoc
class __$$_PasswordAuthInfoCopyWithImpl<$Res>
    extends _$PasswordAuthInfoCopyWithImpl<$Res>
    implements _$$_PasswordAuthInfoCopyWith<$Res> {
  __$$_PasswordAuthInfoCopyWithImpl(
      _$_PasswordAuthInfo _value, $Res Function(_$_PasswordAuthInfo) _then)
      : super(_value, (v) => _then(v as _$_PasswordAuthInfo));

  @override
  _$_PasswordAuthInfo get _value => super._value as _$_PasswordAuthInfo;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_PasswordAuthInfo(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc

class _$_PasswordAuthInfo implements _PasswordAuthInfo {
  const _$_PasswordAuthInfo({required this.email, required this.password});

  @override
  final Email email;
  @override
  final Password password;

  @override
  String toString() {
    return 'PasswordAuthInfo(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PasswordAuthInfo &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_PasswordAuthInfoCopyWith<_$_PasswordAuthInfo> get copyWith =>
      __$$_PasswordAuthInfoCopyWithImpl<_$_PasswordAuthInfo>(this, _$identity);
}

abstract class _PasswordAuthInfo implements PasswordAuthInfo {
  const factory _PasswordAuthInfo(
      {required final Email email,
      required final Password password}) = _$_PasswordAuthInfo;

  @override
  Email get email;
  @override
  Password get password;
  @override
  @JsonKey(ignore: true)
  _$$_PasswordAuthInfoCopyWith<_$_PasswordAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
