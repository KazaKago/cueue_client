// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'google_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleProvider {
  UserId get uid => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleProviderCopyWith<GoogleProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleProviderCopyWith<$Res> {
  factory $GoogleProviderCopyWith(
          GoogleProvider value, $Res Function(GoogleProvider) then) =
      _$GoogleProviderCopyWithImpl<$Res>;
  $Res call({UserId uid, String displayName});

  $UserIdCopyWith<$Res> get uid;
}

/// @nodoc
class _$GoogleProviderCopyWithImpl<$Res>
    implements $GoogleProviderCopyWith<$Res> {
  _$GoogleProviderCopyWithImpl(this._value, this._then);

  final GoogleProvider _value;
  // ignore: unused_field
  final $Res Function(GoogleProvider) _then;

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
abstract class _$GoogleProviderCopyWith<$Res>
    implements $GoogleProviderCopyWith<$Res> {
  factory _$GoogleProviderCopyWith(
          _GoogleProvider value, $Res Function(_GoogleProvider) then) =
      __$GoogleProviderCopyWithImpl<$Res>;
  @override
  $Res call({UserId uid, String displayName});

  @override
  $UserIdCopyWith<$Res> get uid;
}

/// @nodoc
class __$GoogleProviderCopyWithImpl<$Res>
    extends _$GoogleProviderCopyWithImpl<$Res>
    implements _$GoogleProviderCopyWith<$Res> {
  __$GoogleProviderCopyWithImpl(
      _GoogleProvider _value, $Res Function(_GoogleProvider) _then)
      : super(_value, (v) => _then(v as _GoogleProvider));

  @override
  _GoogleProvider get _value => super._value as _GoogleProvider;

  @override
  $Res call({
    Object? uid = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_GoogleProvider(
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

class _$_GoogleProvider implements _GoogleProvider {
  const _$_GoogleProvider({required this.uid, required this.displayName});

  @override
  final UserId uid;
  @override
  final String displayName;

  @override
  String toString() {
    return 'GoogleProvider(uid: $uid, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoogleProvider &&
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
  _$GoogleProviderCopyWith<_GoogleProvider> get copyWith =>
      __$GoogleProviderCopyWithImpl<_GoogleProvider>(this, _$identity);
}

abstract class _GoogleProvider implements GoogleProvider {
  const factory _GoogleProvider(
      {required final UserId uid,
      required final String displayName}) = _$_GoogleProvider;

  @override
  UserId get uid => throw _privateConstructorUsedError;
  @override
  String get displayName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GoogleProviderCopyWith<_GoogleProvider> get copyWith =>
      throw _privateConstructorUsedError;
}
