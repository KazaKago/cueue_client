// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleProvider {
  String get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleProviderCopyWith<GoogleProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleProviderCopyWith<$Res> {
  factory $GoogleProviderCopyWith(
          GoogleProvider value, $Res Function(GoogleProvider) then) =
      _$GoogleProviderCopyWithImpl<$Res, GoogleProvider>;
  @useResult
  $Res call({String uid, String? email, String displayName});
}

/// @nodoc
class _$GoogleProviderCopyWithImpl<$Res, $Val extends GoogleProvider>
    implements $GoogleProviderCopyWith<$Res> {
  _$GoogleProviderCopyWithImpl(this._value, this._then);

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
abstract class _$$GoogleProviderImplCopyWith<$Res>
    implements $GoogleProviderCopyWith<$Res> {
  factory _$$GoogleProviderImplCopyWith(_$GoogleProviderImpl value,
          $Res Function(_$GoogleProviderImpl) then) =
      __$$GoogleProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String? email, String displayName});
}

/// @nodoc
class __$$GoogleProviderImplCopyWithImpl<$Res>
    extends _$GoogleProviderCopyWithImpl<$Res, _$GoogleProviderImpl>
    implements _$$GoogleProviderImplCopyWith<$Res> {
  __$$GoogleProviderImplCopyWithImpl(
      _$GoogleProviderImpl _value, $Res Function(_$GoogleProviderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = freezed,
    Object? displayName = null,
  }) {
    return _then(_$GoogleProviderImpl(
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

class _$GoogleProviderImpl implements _GoogleProvider {
  const _$GoogleProviderImpl(
      {required this.uid, required this.email, required this.displayName});

  @override
  final String uid;
  @override
  final String? email;
  @override
  final String displayName;

  @override
  String toString() {
    return 'GoogleProvider(uid: $uid, email: $email, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleProviderImpl &&
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
  _$$GoogleProviderImplCopyWith<_$GoogleProviderImpl> get copyWith =>
      __$$GoogleProviderImplCopyWithImpl<_$GoogleProviderImpl>(
          this, _$identity);
}

abstract class _GoogleProvider implements GoogleProvider {
  const factory _GoogleProvider(
      {required final String uid,
      required final String? email,
      required final String displayName}) = _$GoogleProviderImpl;

  @override
  String get uid;
  @override
  String? get email;
  @override
  String get displayName;
  @override
  @JsonKey(ignore: true)
  _$$GoogleProviderImplCopyWith<_$GoogleProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
