// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'apple_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppleAuthInfoTearOff {
  const _$AppleAuthInfoTearOff();

  _AppleAuthInfo call(
      {required String idToken,
      required String accessToken,
      required String rawNonce}) {
    return _AppleAuthInfo(
      idToken: idToken,
      accessToken: accessToken,
      rawNonce: rawNonce,
    );
  }
}

/// @nodoc
const $AppleAuthInfo = _$AppleAuthInfoTearOff();

/// @nodoc
mixin _$AppleAuthInfo {
  String get idToken => throw _privateConstructorUsedError;
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
      _$AppleAuthInfoCopyWithImpl<$Res>;
  $Res call({String idToken, String accessToken, String rawNonce});
}

/// @nodoc
class _$AppleAuthInfoCopyWithImpl<$Res>
    implements $AppleAuthInfoCopyWith<$Res> {
  _$AppleAuthInfoCopyWithImpl(this._value, this._then);

  final AppleAuthInfo _value;
  // ignore: unused_field
  final $Res Function(AppleAuthInfo) _then;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
    Object? rawNonce = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      rawNonce: rawNonce == freezed
          ? _value.rawNonce
          : rawNonce // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AppleAuthInfoCopyWith<$Res>
    implements $AppleAuthInfoCopyWith<$Res> {
  factory _$AppleAuthInfoCopyWith(
          _AppleAuthInfo value, $Res Function(_AppleAuthInfo) then) =
      __$AppleAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String idToken, String accessToken, String rawNonce});
}

/// @nodoc
class __$AppleAuthInfoCopyWithImpl<$Res>
    extends _$AppleAuthInfoCopyWithImpl<$Res>
    implements _$AppleAuthInfoCopyWith<$Res> {
  __$AppleAuthInfoCopyWithImpl(
      _AppleAuthInfo _value, $Res Function(_AppleAuthInfo) _then)
      : super(_value, (v) => _then(v as _AppleAuthInfo));

  @override
  _AppleAuthInfo get _value => super._value as _AppleAuthInfo;

  @override
  $Res call({
    Object? idToken = freezed,
    Object? accessToken = freezed,
    Object? rawNonce = freezed,
  }) {
    return _then(_AppleAuthInfo(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      rawNonce: rawNonce == freezed
          ? _value.rawNonce
          : rawNonce // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppleAuthInfo implements _AppleAuthInfo {
  const _$_AppleAuthInfo(
      {required this.idToken,
      required this.accessToken,
      required this.rawNonce});

  @override
  final String idToken;
  @override
  final String accessToken;
  @override
  final String rawNonce;

  @override
  String toString() {
    return 'AppleAuthInfo(idToken: $idToken, accessToken: $accessToken, rawNonce: $rawNonce)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppleAuthInfo &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality()
                    .equals(other.idToken, idToken)) &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.rawNonce, rawNonce) ||
                const DeepCollectionEquality()
                    .equals(other.rawNonce, rawNonce)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(idToken) ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(rawNonce);

  @JsonKey(ignore: true)
  @override
  _$AppleAuthInfoCopyWith<_AppleAuthInfo> get copyWith =>
      __$AppleAuthInfoCopyWithImpl<_AppleAuthInfo>(this, _$identity);
}

abstract class _AppleAuthInfo implements AppleAuthInfo {
  const factory _AppleAuthInfo(
      {required String idToken,
      required String accessToken,
      required String rawNonce}) = _$_AppleAuthInfo;

  @override
  String get idToken => throw _privateConstructorUsedError;
  @override
  String get accessToken => throw _privateConstructorUsedError;
  @override
  String get rawNonce => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppleAuthInfoCopyWith<_AppleAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
