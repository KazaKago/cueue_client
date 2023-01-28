// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleAuthInfo {
  String? get accessToken => throw _privateConstructorUsedError;

  String? get idToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleAuthInfoCopyWith<GoogleAuthInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthInfoCopyWith<$Res> {
  factory $GoogleAuthInfoCopyWith(GoogleAuthInfo value, $Res Function(GoogleAuthInfo) then) = _$GoogleAuthInfoCopyWithImpl<$Res, GoogleAuthInfo>;

  @useResult
  $Res call({String? accessToken, String? idToken});
}

/// @nodoc
class _$GoogleAuthInfoCopyWithImpl<$Res, $Val extends GoogleAuthInfo> implements $GoogleAuthInfoCopyWith<$Res> {
  _$GoogleAuthInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GoogleAuthInfoCopyWith<$Res> implements $GoogleAuthInfoCopyWith<$Res> {
  factory _$$_GoogleAuthInfoCopyWith(_$_GoogleAuthInfo value, $Res Function(_$_GoogleAuthInfo) then) = __$$_GoogleAuthInfoCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({String? accessToken, String? idToken});
}

/// @nodoc
class __$$_GoogleAuthInfoCopyWithImpl<$Res> extends _$GoogleAuthInfoCopyWithImpl<$Res, _$_GoogleAuthInfo> implements _$$_GoogleAuthInfoCopyWith<$Res> {
  __$$_GoogleAuthInfoCopyWithImpl(_$_GoogleAuthInfo _value, $Res Function(_$_GoogleAuthInfo) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$_GoogleAuthInfo(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_GoogleAuthInfo implements _GoogleAuthInfo {
  const _$_GoogleAuthInfo({required this.accessToken, required this.idToken});

  @override
  final String? accessToken;
  @override
  final String? idToken;

  @override
  String toString() {
    return 'GoogleAuthInfo(accessToken: $accessToken, idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_GoogleAuthInfo && (identical(other.accessToken, accessToken) || other.accessToken == accessToken) && (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GoogleAuthInfoCopyWith<_$_GoogleAuthInfo> get copyWith => __$$_GoogleAuthInfoCopyWithImpl<_$_GoogleAuthInfo>(this, _$identity);
}

abstract class _GoogleAuthInfo implements GoogleAuthInfo {
  const factory _GoogleAuthInfo({required final String? accessToken, required final String? idToken}) = _$_GoogleAuthInfo;

  @override
  String? get accessToken;

  @override
  String? get idToken;

  @override
  @JsonKey(ignore: true)
  _$$_GoogleAuthInfoCopyWith<_$_GoogleAuthInfo> get copyWith => throw _privateConstructorUsedError;
}
