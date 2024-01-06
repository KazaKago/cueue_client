// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleAuthInfo {
  String? get accessToken => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleAuthInfoCopyWith<GoogleAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthInfoCopyWith<$Res> {
  factory $GoogleAuthInfoCopyWith(
          GoogleAuthInfo value, $Res Function(GoogleAuthInfo) then) =
      _$GoogleAuthInfoCopyWithImpl<$Res, GoogleAuthInfo>;
  @useResult
  $Res call({String? accessToken, String? idToken});
}

/// @nodoc
class _$GoogleAuthInfoCopyWithImpl<$Res, $Val extends GoogleAuthInfo>
    implements $GoogleAuthInfoCopyWith<$Res> {
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
abstract class _$$GoogleAuthInfoImplCopyWith<$Res>
    implements $GoogleAuthInfoCopyWith<$Res> {
  factory _$$GoogleAuthInfoImplCopyWith(_$GoogleAuthInfoImpl value,
          $Res Function(_$GoogleAuthInfoImpl) then) =
      __$$GoogleAuthInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accessToken, String? idToken});
}

/// @nodoc
class __$$GoogleAuthInfoImplCopyWithImpl<$Res>
    extends _$GoogleAuthInfoCopyWithImpl<$Res, _$GoogleAuthInfoImpl>
    implements _$$GoogleAuthInfoImplCopyWith<$Res> {
  __$$GoogleAuthInfoImplCopyWithImpl(
      _$GoogleAuthInfoImpl _value, $Res Function(_$GoogleAuthInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_$GoogleAuthInfoImpl(
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

class _$GoogleAuthInfoImpl implements _GoogleAuthInfo {
  const _$GoogleAuthInfoImpl(
      {required this.accessToken, required this.idToken});

  @override
  final String? accessToken;
  @override
  final String? idToken;

  @override
  String toString() {
    return 'GoogleAuthInfo(accessToken: $accessToken, idToken: $idToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleAuthInfoImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleAuthInfoImplCopyWith<_$GoogleAuthInfoImpl> get copyWith =>
      __$$GoogleAuthInfoImplCopyWithImpl<_$GoogleAuthInfoImpl>(
          this, _$identity);
}

abstract class _GoogleAuthInfo implements GoogleAuthInfo {
  const factory _GoogleAuthInfo(
      {required final String? accessToken,
      required final String? idToken}) = _$GoogleAuthInfoImpl;

  @override
  String? get accessToken;
  @override
  String? get idToken;
  @override
  @JsonKey(ignore: true)
  _$$GoogleAuthInfoImplCopyWith<_$GoogleAuthInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
