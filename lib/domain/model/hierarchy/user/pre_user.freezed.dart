// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$PreUserCopyWithImpl<$Res>;
  $Res call({String displayName, Content? photo});

  $ContentCopyWith<$Res>? get photo;
}

/// @nodoc
class _$PreUserCopyWithImpl<$Res> implements $PreUserCopyWith<$Res> {
  _$PreUserCopyWithImpl(this._value, this._then);

  final PreUser _value;
  // ignore: unused_field
  final $Res Function(PreUser) _then;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Content?,
    ));
  }

  @override
  $ContentCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value));
    });
  }
}

/// @nodoc
abstract class _$$_PreUserCopyWith<$Res> implements $PreUserCopyWith<$Res> {
  factory _$$_PreUserCopyWith(
          _$_PreUser value, $Res Function(_$_PreUser) then) =
      __$$_PreUserCopyWithImpl<$Res>;
  @override
  $Res call({String displayName, Content? photo});

  @override
  $ContentCopyWith<$Res>? get photo;
}

/// @nodoc
class __$$_PreUserCopyWithImpl<$Res> extends _$PreUserCopyWithImpl<$Res>
    implements _$$_PreUserCopyWith<$Res> {
  __$$_PreUserCopyWithImpl(_$_PreUser _value, $Res Function(_$_PreUser) _then)
      : super(_value, (v) => _then(v as _$_PreUser));

  @override
  _$_PreUser get _value => super._value as _$_PreUser;

  @override
  $Res call({
    Object? displayName = freezed,
    Object? photo = freezed,
  }) {
    return _then(_$_PreUser(
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Content?,
    ));
  }
}

/// @nodoc

class _$_PreUser implements _PreUser {
  const _$_PreUser({required this.displayName, required this.photo});

  @override
  final String displayName;
  @override
  final Content? photo;

  @override
  String toString() {
    return 'PreUser(displayName: $displayName, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreUser &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.photo, photo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(photo));

  @JsonKey(ignore: true)
  @override
  _$$_PreUserCopyWith<_$_PreUser> get copyWith =>
      __$$_PreUserCopyWithImpl<_$_PreUser>(this, _$identity);
}

abstract class _PreUser implements PreUser {
  const factory _PreUser(
      {required final String displayName,
      required final Content? photo}) = _$_PreUser;

  @override
  String get displayName;
  @override
  Content? get photo;
  @override
  @JsonKey(ignore: true)
  _$$_PreUserCopyWith<_$_PreUser> get copyWith =>
      throw _privateConstructorUsedError;
}
