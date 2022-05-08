// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'apple_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppleProvider {
  UserId get uid => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppleProviderCopyWith<AppleProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleProviderCopyWith<$Res> {
  factory $AppleProviderCopyWith(
          AppleProvider value, $Res Function(AppleProvider) then) =
      _$AppleProviderCopyWithImpl<$Res>;
  $Res call({UserId uid, String displayName});

  $UserIdCopyWith<$Res> get uid;
}

/// @nodoc
class _$AppleProviderCopyWithImpl<$Res>
    implements $AppleProviderCopyWith<$Res> {
  _$AppleProviderCopyWithImpl(this._value, this._then);

  final AppleProvider _value;
  // ignore: unused_field
  final $Res Function(AppleProvider) _then;

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
abstract class _$$_AppleProviderCopyWith<$Res>
    implements $AppleProviderCopyWith<$Res> {
  factory _$$_AppleProviderCopyWith(
          _$_AppleProvider value, $Res Function(_$_AppleProvider) then) =
      __$$_AppleProviderCopyWithImpl<$Res>;
  @override
  $Res call({UserId uid, String displayName});

  @override
  $UserIdCopyWith<$Res> get uid;
}

/// @nodoc
class __$$_AppleProviderCopyWithImpl<$Res>
    extends _$AppleProviderCopyWithImpl<$Res>
    implements _$$_AppleProviderCopyWith<$Res> {
  __$$_AppleProviderCopyWithImpl(
      _$_AppleProvider _value, $Res Function(_$_AppleProvider) _then)
      : super(_value, (v) => _then(v as _$_AppleProvider));

  @override
  _$_AppleProvider get _value => super._value as _$_AppleProvider;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$_AppleProvider(
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

class _$_AppleProvider implements _AppleProvider {
  const _$_AppleProvider({required this.uid, required this.displayName});

  @override
  final UserId uid;
  @override
  final String displayName;

  @override
  String toString() {
    return 'AppleProvider(uid: $uid, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppleProvider &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(displayName));

  @JsonKey(ignore: true)
  @override
  _$$_AppleProviderCopyWith<_$_AppleProvider> get copyWith =>
      __$$_AppleProviderCopyWithImpl<_$_AppleProvider>(this, _$identity);
}

abstract class _AppleProvider implements AppleProvider {
  const factory _AppleProvider(
      {required final UserId uid,
      required final String displayName}) = _$_AppleProvider;

  @override
  UserId get uid => throw _privateConstructorUsedError;
  @override
  String get displayName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AppleProviderCopyWith<_$_AppleProvider> get copyWith =>
      throw _privateConstructorUsedError;
}
