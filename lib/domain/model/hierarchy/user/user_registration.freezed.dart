// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRegistration {
  String get displayName => throw _privateConstructorUsedError;
  ContentKey? get photoKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRegistrationCopyWith<UserRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRegistrationCopyWith<$Res> {
  factory $UserRegistrationCopyWith(
          UserRegistration value, $Res Function(UserRegistration) then) =
      _$UserRegistrationCopyWithImpl<$Res>;
  $Res call({String displayName, ContentKey? photoKey});

  $ContentKeyCopyWith<$Res>? get photoKey;
}

/// @nodoc
class _$UserRegistrationCopyWithImpl<$Res>
    implements $UserRegistrationCopyWith<$Res> {
  _$UserRegistrationCopyWithImpl(this._value, this._then);

  final UserRegistration _value;
  // ignore: unused_field
  final $Res Function(UserRegistration) _then;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? photoKey = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoKey: photoKey == freezed
          ? _value.photoKey
          : photoKey // ignore: cast_nullable_to_non_nullable
              as ContentKey?,
    ));
  }

  @override
  $ContentKeyCopyWith<$Res>? get photoKey {
    if (_value.photoKey == null) {
      return null;
    }

    return $ContentKeyCopyWith<$Res>(_value.photoKey!, (value) {
      return _then(_value.copyWith(photoKey: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserRegistrationCopyWith<$Res>
    implements $UserRegistrationCopyWith<$Res> {
  factory _$$_UserRegistrationCopyWith(
          _$_UserRegistration value, $Res Function(_$_UserRegistration) then) =
      __$$_UserRegistrationCopyWithImpl<$Res>;
  @override
  $Res call({String displayName, ContentKey? photoKey});

  @override
  $ContentKeyCopyWith<$Res>? get photoKey;
}

/// @nodoc
class __$$_UserRegistrationCopyWithImpl<$Res>
    extends _$UserRegistrationCopyWithImpl<$Res>
    implements _$$_UserRegistrationCopyWith<$Res> {
  __$$_UserRegistrationCopyWithImpl(
      _$_UserRegistration _value, $Res Function(_$_UserRegistration) _then)
      : super(_value, (v) => _then(v as _$_UserRegistration));

  @override
  _$_UserRegistration get _value => super._value as _$_UserRegistration;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? photoKey = freezed,
  }) {
    return _then(_$_UserRegistration(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoKey: photoKey == freezed
          ? _value.photoKey
          : photoKey // ignore: cast_nullable_to_non_nullable
              as ContentKey?,
    ));
  }
}

/// @nodoc

class _$_UserRegistration implements _UserRegistration {
  const _$_UserRegistration(
      {required this.displayName, required this.photoKey});

  @override
  final String displayName;
  @override
  final ContentKey? photoKey;

  @override
  String toString() {
    return 'UserRegistration(displayName: $displayName, photoKey: $photoKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRegistration &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.photoKey, photoKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(photoKey));

  @JsonKey(ignore: true)
  @override
  _$$_UserRegistrationCopyWith<_$_UserRegistration> get copyWith =>
      __$$_UserRegistrationCopyWithImpl<_$_UserRegistration>(this, _$identity);
}

abstract class _UserRegistration implements UserRegistration {
  const factory _UserRegistration(
      {required final String displayName,
      required final ContentKey? photoKey}) = _$_UserRegistration;

  @override
  String get displayName;
  @override
  ContentKey? get photoKey;
  @override
  @JsonKey(ignore: true)
  _$$_UserRegistrationCopyWith<_$_UserRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
