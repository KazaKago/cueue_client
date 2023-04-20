// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppleProvider {
  String get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppleProviderCopyWith<AppleProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleProviderCopyWith<$Res> {
  factory $AppleProviderCopyWith(
          AppleProvider value, $Res Function(AppleProvider) then) =
      _$AppleProviderCopyWithImpl<$Res, AppleProvider>;
  @useResult
  $Res call({String uid, String? email, String displayName});
}

/// @nodoc
class _$AppleProviderCopyWithImpl<$Res, $Val extends AppleProvider>
    implements $AppleProviderCopyWith<$Res> {
  _$AppleProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = freezed,
    Object? displayName = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppleProviderCopyWith<$Res>
    implements $AppleProviderCopyWith<$Res> {
  factory _$$_AppleProviderCopyWith(
          _$_AppleProvider value, $Res Function(_$_AppleProvider) then) =
      __$$_AppleProviderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String? email, String displayName});
}

/// @nodoc
class __$$_AppleProviderCopyWithImpl<$Res>
    extends _$AppleProviderCopyWithImpl<$Res, _$_AppleProvider>
    implements _$$_AppleProviderCopyWith<$Res> {
  __$$_AppleProviderCopyWithImpl(
      _$_AppleProvider _value, $Res Function(_$_AppleProvider) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = freezed,
    Object? displayName = null,
  }) {
    return _then(_$_AppleProvider(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppleProvider implements _AppleProvider {
  const _$_AppleProvider(
      {required this.uid, required this.email, required this.displayName});

  @override
  final String uid;
  @override
  final String? email;
  @override
  final String displayName;

  @override
  String toString() {
    return 'AppleProvider(uid: $uid, email: $email, displayName: $displayName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppleProvider &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, email, displayName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppleProviderCopyWith<_$_AppleProvider> get copyWith =>
      __$$_AppleProviderCopyWithImpl<_$_AppleProvider>(this, _$identity);
}

abstract class _AppleProvider implements AppleProvider {
  const factory _AppleProvider(
      {required final String uid,
      required final String? email,
      required final String displayName}) = _$_AppleProvider;

  @override
  String get uid;
  @override
  String? get email;
  @override
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$_AppleProviderCopyWith<_$_AppleProvider> get copyWith =>
      throw _privateConstructorUsedError;
}
