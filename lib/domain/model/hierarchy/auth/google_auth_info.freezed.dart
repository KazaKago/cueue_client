// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'google_auth_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GoogleAuthInfoTearOff {
  const _$GoogleAuthInfoTearOff();

  _GoogleAuthInfo call({required String accessToken, required String idToken}) {
    return _GoogleAuthInfo(
      accessToken: accessToken,
      idToken: idToken,
    );
  }
}

/// @nodoc
const $GoogleAuthInfo = _$GoogleAuthInfoTearOff();

/// @nodoc
mixin _$GoogleAuthInfo {
  String get accessToken => throw _privateConstructorUsedError;
  String get idToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleAuthInfoCopyWith<GoogleAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthInfoCopyWith<$Res> {
  factory $GoogleAuthInfoCopyWith(
          GoogleAuthInfo value, $Res Function(GoogleAuthInfo) then) =
      _$GoogleAuthInfoCopyWithImpl<$Res>;
  $Res call({String accessToken, String idToken});
}

/// @nodoc
class _$GoogleAuthInfoCopyWithImpl<$Res>
    implements $GoogleAuthInfoCopyWith<$Res> {
  _$GoogleAuthInfoCopyWithImpl(this._value, this._then);

  final GoogleAuthInfo _value;
  // ignore: unused_field
  final $Res Function(GoogleAuthInfo) _then;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GoogleAuthInfoCopyWith<$Res>
    implements $GoogleAuthInfoCopyWith<$Res> {
  factory _$GoogleAuthInfoCopyWith(
          _GoogleAuthInfo value, $Res Function(_GoogleAuthInfo) then) =
      __$GoogleAuthInfoCopyWithImpl<$Res>;
  @override
  $Res call({String accessToken, String idToken});
}

/// @nodoc
class __$GoogleAuthInfoCopyWithImpl<$Res>
    extends _$GoogleAuthInfoCopyWithImpl<$Res>
    implements _$GoogleAuthInfoCopyWith<$Res> {
  __$GoogleAuthInfoCopyWithImpl(
      _GoogleAuthInfo _value, $Res Function(_GoogleAuthInfo) _then)
      : super(_value, (v) => _then(v as _GoogleAuthInfo));

  @override
  _GoogleAuthInfo get _value => super._value as _GoogleAuthInfo;

  @override
  $Res call({
    Object? accessToken = freezed,
    Object? idToken = freezed,
  }) {
    return _then(_GoogleAuthInfo(
      accessToken: accessToken == freezed
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GoogleAuthInfo implements _GoogleAuthInfo {
  const _$_GoogleAuthInfo({required this.accessToken, required this.idToken});

  @override
  final String accessToken;
  @override
  final String idToken;

  @override
  String toString() {
    return 'GoogleAuthInfo(accessToken: $accessToken, idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GoogleAuthInfo &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.idToken, idToken) ||
                const DeepCollectionEquality().equals(other.idToken, idToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(idToken);

  @JsonKey(ignore: true)
  @override
  _$GoogleAuthInfoCopyWith<_GoogleAuthInfo> get copyWith =>
      __$GoogleAuthInfoCopyWithImpl<_GoogleAuthInfo>(this, _$identity);
}

abstract class _GoogleAuthInfo implements GoogleAuthInfo {
  const factory _GoogleAuthInfo(
      {required String accessToken,
      required String idToken}) = _$_GoogleAuthInfo;

  @override
  String get accessToken => throw _privateConstructorUsedError;
  @override
  String get idToken => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GoogleAuthInfoCopyWith<_GoogleAuthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
