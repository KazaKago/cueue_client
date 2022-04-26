// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasswordProviderTearOff {
  const _$PasswordProviderTearOff();

  _PasswordProvider call({required UserId uid, required String displayName}) {
    return _PasswordProvider(
      uid: uid,
      displayName: displayName,
    );
  }
}

/// @nodoc
const $PasswordProvider = _$PasswordProviderTearOff();

/// @nodoc
mixin _$PasswordProvider {
  UserId get uid => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordProviderCopyWith<PasswordProvider> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordProviderCopyWith<$Res> {
  factory $PasswordProviderCopyWith(PasswordProvider value, $Res Function(PasswordProvider) then) = _$PasswordProviderCopyWithImpl<$Res>;
  $Res call({UserId uid, String displayName});

  $UserIdCopyWith<$Res> get uid;
}

/// @nodoc
class _$PasswordProviderCopyWithImpl<$Res> implements $PasswordProviderCopyWith<$Res> {
  _$PasswordProviderCopyWithImpl(this._value, this._then);

  final PasswordProvider _value;
  // ignore: unused_field
  final $Res Function(PasswordProvider) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as UserId,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $UserIdCopyWith<$Res> get uid {
    return $UserIdCopyWith<$Res>(_value.uid, (value) {
      return _then(_value.copyWith(uid: value));
    });
  }
}

/// @nodoc
abstract class _$PasswordProviderCopyWith<$Res> implements $PasswordProviderCopyWith<$Res> {
  factory _$PasswordProviderCopyWith(_PasswordProvider value, $Res Function(_PasswordProvider) then) = __$PasswordProviderCopyWithImpl<$Res>;
  @override
  $Res call({UserId uid, String displayName});

  @override
  $UserIdCopyWith<$Res> get uid;
}

/// @nodoc
class __$PasswordProviderCopyWithImpl<$Res> extends _$PasswordProviderCopyWithImpl<$Res> implements _$PasswordProviderCopyWith<$Res> {
  __$PasswordProviderCopyWithImpl(_PasswordProvider _value, $Res Function(_PasswordProvider) _then) : super(_value, (v) => _then(v as _PasswordProvider));

  @override
  _PasswordProvider get _value => super._value as _PasswordProvider;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_PasswordProvider(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as UserId,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PasswordProvider implements _PasswordProvider {
  const _$_PasswordProvider({required this.uid, required this.displayName});

  @override
  final UserId uid;
  @override
  final String displayName;

  @override
  String toString() {
    return 'PasswordProvider(uid: $uid, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _PasswordProvider && const DeepCollectionEquality().equals(other.uid, uid) && const DeepCollectionEquality().equals(other.displayName, displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(uid), const DeepCollectionEquality().hash(displayName));

  @JsonKey(ignore: true)
  @override
  _$PasswordProviderCopyWith<_PasswordProvider> get copyWith => __$PasswordProviderCopyWithImpl<_PasswordProvider>(this, _$identity);
}

abstract class _PasswordProvider implements PasswordProvider {
  const factory _PasswordProvider({required UserId uid, required String displayName}) = _$_PasswordProvider;

  @override
  UserId get uid;
  @override
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$PasswordProviderCopyWith<_PasswordProvider> get copyWith => throw _privateConstructorUsedError;
}
