// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pre_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PreUser {
  String get displayName => throw _privateConstructorUsedError;
  Content? get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreUserCopyWith<PreUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreUserCopyWith<$Res> {
  factory $PreUserCopyWith(PreUser value, $Res Function(PreUser) then) =
      _$PreUserCopyWithImpl<$Res, PreUser>;
  @useResult
  $Res call({String displayName, Content? photo});

  $ContentCopyWith<$Res>? get photo;
}

/// @nodoc
class _$PreUserCopyWithImpl<$Res, $Val extends PreUser>
    implements $PreUserCopyWith<$Res> {
  _$PreUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Content?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PreUserImplCopyWith<$Res> implements $PreUserCopyWith<$Res> {
  factory _$$PreUserImplCopyWith(
          _$PreUserImpl value, $Res Function(_$PreUserImpl) then) =
      __$$PreUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, Content? photo});

  @override
  $ContentCopyWith<$Res>? get photo;
}

/// @nodoc
class __$$PreUserImplCopyWithImpl<$Res>
    extends _$PreUserCopyWithImpl<$Res, _$PreUserImpl>
    implements _$$PreUserImplCopyWith<$Res> {
  __$$PreUserImplCopyWithImpl(
      _$PreUserImpl _value, $Res Function(_$PreUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? photo = freezed,
  }) {
    return _then(_$PreUserImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Content?,
    ));
  }
}

/// @nodoc

class _$PreUserImpl implements _PreUser {
  const _$PreUserImpl({required this.displayName, required this.photo});

  @override
  final String displayName;
  @override
  final Content? photo;

  @override
  String toString() {
    return 'PreUser(displayName: $displayName, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreUserImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreUserImplCopyWith<_$PreUserImpl> get copyWith =>
      __$$PreUserImplCopyWithImpl<_$PreUserImpl>(this, _$identity);
}

abstract class _PreUser implements PreUser {
  const factory _PreUser(
      {required final String displayName,
      required final Content? photo}) = _$PreUserImpl;

  @override
  String get displayName;
  @override
  Content? get photo;
  @override
  @JsonKey(ignore: true)
  _$$PreUserImplCopyWith<_$PreUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
