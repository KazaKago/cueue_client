// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppleAuthInfo {
  String? get idToken => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  String get rawNonce => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppleAuthInfoCopyWith<AppleAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleAuthInfoCopyWith<$Res> {
  factory $AppleAuthInfoCopyWith(
          AppleAuthInfo value, $Res Function(AppleAuthInfo) then) =
      _$AppleAuthInfoCopyWithImpl<$Res, AppleAuthInfo>;
  @useResult
  $Res call({String? idToken, String accessToken, String rawNonce});
}

/// @nodoc
class _$AppleAuthInfoCopyWithImpl<$Res, $Val extends AppleAuthInfo>
    implements $AppleAuthInfoCopyWith<$Res> {
  _$AppleAuthInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = null,
    Object? rawNonce = null,
  }) {
    return _then(_value.copyWith(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      rawNonce: null == rawNonce
          ? _value.rawNonce
          : rawNonce // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppleAuthInfoImplCopyWith<$Res>
    implements $AppleAuthInfoCopyWith<$Res> {
  factory _$$AppleAuthInfoImplCopyWith(
          _$AppleAuthInfoImpl value, $Res Function(_$AppleAuthInfoImpl) then) =
      __$$AppleAuthInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? idToken, String accessToken, String rawNonce});
}

/// @nodoc
class __$$AppleAuthInfoImplCopyWithImpl<$Res>
    extends _$AppleAuthInfoCopyWithImpl<$Res, _$AppleAuthInfoImpl>
    implements _$$AppleAuthInfoImplCopyWith<$Res> {
  __$$AppleAuthInfoImplCopyWithImpl(
      _$AppleAuthInfoImpl _value, $Res Function(_$AppleAuthInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = null,
    Object? rawNonce = null,
  }) {
    return _then(_$AppleAuthInfoImpl(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      rawNonce: null == rawNonce
          ? _value.rawNonce
          : rawNonce // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppleAuthInfoImpl implements _AppleAuthInfo {
  const _$AppleAuthInfoImpl(
      {required this.idToken,
      required this.accessToken,
      required this.rawNonce});

  @override
  final String? idToken;
  @override
  final String accessToken;
  @override
  final String rawNonce;

  @override
  String toString() {
    return 'AppleAuthInfo(idToken: $idToken, accessToken: $accessToken, rawNonce: $rawNonce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleAuthInfoImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.rawNonce, rawNonce) ||
                other.rawNonce == rawNonce));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idToken, accessToken, rawNonce);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleAuthInfoImplCopyWith<_$AppleAuthInfoImpl> get copyWith =>
      __$$AppleAuthInfoImplCopyWithImpl<_$AppleAuthInfoImpl>(this, _$identity);
}

abstract class _AppleAuthInfo implements AppleAuthInfo {
  const factory _AppleAuthInfo(
      {required final String? idToken,
      required final String accessToken,
      required final String rawNonce}) = _$AppleAuthInfoImpl;

  @override
  String? get idToken;
  @override
  String get accessToken;
  @override
  String get rawNonce;
  @override
  @JsonKey(ignore: true)
  _$$AppleAuthInfoImplCopyWith<_$AppleAuthInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
